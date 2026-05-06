// ignore: depend_on_referenced_packages
import 'package:async/async.dart';
import 'package:nawy/features/auth/data/models/login_response_body.dart';
import 'package:nawy/features/home/data/models/home_response.dart';
import 'package:nawy/features/my_booking/data/models/booking_details_model.dart';
abstract class IMyBookingRepository {
  Future<Result<BookingDetailsModel>> bookDetails({ int? bookId,});

}
