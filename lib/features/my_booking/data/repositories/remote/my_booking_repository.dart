// ignore: implementation_imports, depend_on_referenced_packages
import 'dart:developer';

import 'package:async/async.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';
import 'package:nawy/core/services/network/network_service.dart';
import 'package:nawy/core/utils/constants/constants.dart';
import 'package:nawy/features/auth/data/models/login_response_body.dart';
import 'package:nawy/features/home/data/models/home_response.dart';
import 'package:nawy/features/my_booking/data/models/booking_details_model.dart';

import '../interfaces/i_my_booking_repository.dart';

@Injectable(as: IMyBookingRepository)
class MyBookingRepository implements IMyBookingRepository {
  final NetworkService networkService;

  MyBookingRepository({required this.networkService});

  @override
  Future<Result<BookingDetailsModel>> bookDetails({ int? bookId,}) async {
    var response = await networkService.getAsync(
      url: AppStrings.urls.bookingDetailsUrl,
      queryParameters: {

        "id":bookId,
      }
    );
    if (response.isError) return Result.error(response.asError!.error);

    log("registerAsync.asValue?.value22!!${response.asValue?.value.data['data']}");
    return Result.value(
      BookingDetailsModel.fromJson(response.asValue?.value.data['data']['booking']),
    );
  }
}
