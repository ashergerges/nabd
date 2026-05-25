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
  @override
  Future<Result<String>> cancelBook({required int bookId,String? reason,}) async {
    var response = await networkService.postAsync(
      url: AppStrings.urls.cancelBookUrl,
      body: {
        "id":bookId,
        "reason":reason??""
      }
    );
    if (response.isError) return Result.error(response.asError!.error);

    log("registerAsync.asValue?.value22!!${response.asValue?.value.data['message']}");
    return Result.value(response.asValue?.value.data['message'],
    );
  }
  @override
  Future<Result<String>> sendRate({ required int bookId,required int score, String? comment,} ) async {
    var response = await networkService.postAsync(
      url: AppStrings.urls.reviewAddUrl,
      body: {
        "booking_id":bookId,
        "rating":score,
        "comment":comment,
      }
    );
    if (response.isError) return Result.error(response.asError!.error);

    log("registerAsync.asValue?.value22!!${response.asValue?.value.data['message']}");
    return Result.value(response.asValue?.value.data['message']??"",
    );
  }

  @override
  Future<Result<List<BookingDetailsModel>>> myBook({required int status,required int page,String? search}) async {
    var response = await networkService.getAsync(
      url: AppStrings.urls.myBookingUrl,
      queryParameters: {
        "status":status,
        "page":page,
        "paginate":1,
       if(search!=null) "search":search,
      }
    );
    if (response.isError) return Result.error(response.asError!.error);

    log("registerAsync.asValue?.value22!!${response.asValue?.value.data['data']}");
    List<BookingDetailsModel> myBooks = List<BookingDetailsModel>.from(
        response.asValue?.value.data['data']['bookings'].map((x) => BookingDetailsModel.fromJson(x)));

    return Result.value(myBooks    );
  }
}
