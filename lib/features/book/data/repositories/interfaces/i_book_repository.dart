// ignore: depend_on_referenced_packages
import 'package:async/async.dart';
import 'package:nawy/features/book/data/model/book_confirmation_model.dart';
import 'package:nawy/features/book/data/model/booking_request_model.dart';
import 'package:nawy/features/book/data/model/payment_method_model.dart';
abstract class IBookRepository {
  Future<Result<List<String>>> getTimeSlots({ required int vendorId,required String date ,});
  Future<Result<List<PaymentMethodModel>>> paymentMethods();
  Future<Result<BookConfirmationModel>> makeBook({required BookingRequestModel bookingRequest});

}
