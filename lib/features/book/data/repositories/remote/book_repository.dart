// ignore: implementation_imports, depend_on_referenced_packages
import 'dart:developer';

import 'package:async/async.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';
import 'package:nawy/core/services/network/network_service.dart';
import 'package:nawy/core/utils/constants/constants.dart';
import 'package:nawy/features/auth/data/models/login_response_body.dart';
import 'package:nawy/features/book/data/model/book_confirmation_model.dart';
import 'package:nawy/features/book/data/model/booking_request_model.dart';
import 'package:nawy/features/book/data/model/payment_method_model.dart';
import 'package:nawy/features/home/data/models/home_response.dart';

import '../interfaces/i_book_repository.dart';

@Injectable(as: IBookRepository)
class BookRepository implements IBookRepository {
  final NetworkService networkService;

  BookRepository({required this.networkService});

  @override
  Future<Result<List<String>>> getTimeSlots({
    required int vendorId,
    required String date,
  }) async {
    var response = await networkService.getAsync(
        url: AppStrings.urls.timeSlotsUrl,
        queryParameters: {
          "vendor_id": vendorId,
          "date": date,
        }
    );

    if (response.isError) return Result.error(response.asError!.error);

    log("registerAsync.asValue?.value22!!${response.asValue?.value.data['data']['available_slots']}");

    // Convert List<dynamic> to List<String>
    final List<dynamic> dynamicSlots =
        response.asValue?.value.data['data']['available_slots'] ?? [];

    final List<String> timeSlots = dynamicSlots
        .map((slot) => slot.toString())
        .toList();

    return Result.value(timeSlots);
  }
  @override
  Future<Result<List<PaymentMethodModel>>> paymentMethods() async {
    var response = await networkService.getAsync(
      url: AppStrings.urls.paymentMethodUrl,

    );
    if (response.isError) return Result.error(response.asError!.error);

    log("registerAsync.asValue?.value22!!${response.asValue?.value.data['data']}");
    List<PaymentMethodModel> paymentMethods = List<PaymentMethodModel>.from(
        response.asValue?.value.data['data']['payment_types'].map((x) => PaymentMethodModel.fromJson(x)));

    return Result.value(
        paymentMethods    );
  }
  @override
  Future<Result<BookConfirmationModel>> makeBook({required BookingRequestModel bookingRequest})async {
    var response = await networkService.postAsync(
      url: AppStrings.urls.makeBookUrl,
      body: bookingRequest.toJson()
    );
    if (response.isError) return Result.error(response.asError!.error);

    log("registerAsync.asValue?.value22!!${response.asValue?.value.data['data']['message']}");

    return Result.value( BookConfirmationModel.fromJson(response.asValue?.value.data['data']['booking']  )  );
  }
}
