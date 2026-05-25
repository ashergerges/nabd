import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nawy/core/services/dialogs/message_service.dart';
import 'package:nawy/features/book/data/model/book_confirmation_model.dart';
import 'package:nawy/features/book/data/model/booking_request_model.dart';
import 'package:nawy/features/book/data/model/payment_method_model.dart';
import 'package:nawy/features/book/data/repositories/interfaces/i_book_repository.dart';
import 'package:nawy/main_common.dart';

part 'book_state.dart';
part 'book_cubit.freezed.dart';

class BookCubit extends Cubit<BookState> {
  BookCubit() :
        _repository=getIt<IBookRepository>(),

        super(BookState(bookRequest:BookingRequestModel() ));
  final IBookRepository _repository;

  void currentStep(int value){
    emit(state.copyWith(currentStep: value));
  }
  void setDate( {required String value,required int vendorId}){
    emit(state.copyWith(bookRequest:state.bookRequest?.copyWith(date:value )));
    getTimeSlots(vendorId:vendorId ,date: value);
  }
  void setTime( {required String value,}){
    emit(state.copyWith(bookRequest:state.bookRequest?.copyWith(time:value )));
  }
  void setPaymentMethods( {required int value,}){
    emit(state.copyWith(bookRequest:state.bookRequest?.copyWith(paymentMethod:value )));
  }
  Future<void> getTimeSlots({ required int vendorId,required String date ,}) async {
    emit(state.copyWith(currState: Loading()));

    var getTimeSlots = await _repository.getTimeSlots(vendorId: vendorId, date: date);
    if (getTimeSlots.isError) {
      MessageService.showToast(
        msg: getTimeSlots.asError?.error.toString() ?? "",
        state: ToastStates.error,
      );
      emit(state.copyWith(currState: Error()));

      return;
    }
    emit(state.copyWith( currState: Success(),bookRequest: state.bookRequest?.copyWith(date:date, time: (getTimeSlots.asValue?.value??[]).isEmpty?null:(getTimeSlots.asValue?.value??[]).first),availableSlots:getTimeSlots.asValue?.value??[],));
    return;
  }
  Future<void> paymentMethods(double price,int? packageId) async {
    var paymentMethods = await _repository.paymentMethods();
    if (paymentMethods.isError) {
      MessageService.showToast(
        msg: paymentMethods.asError?.error.toString() ?? "",
        state: ToastStates.error,
      );
      emit(state.copyWith(currState: Error()));

      return;
    }
    emit(state.copyWith( paymentMethods: paymentMethods.asValue?.value??[],bookRequest: state.bookRequest?.copyWith(packageId:packageId,totalPrice: (price ).toString(),paymentMethod: ( paymentMethods.asValue?.value??[]).isEmpty?null:( paymentMethods.asValue?.value??[]).first.id)));
    return;
  }


  Future<BookConfirmationModel?> makeBook() async {
    emit(state.copyWith(currState: Loading()));

    var makeBook = await _repository.makeBook(bookingRequest:state.bookRequest??BookingRequestModel());

    if (makeBook.isError) {
      MessageService.showToast(
        msg: makeBook.asError?.error.toString() ?? "",
        state: ToastStates.error,
      );
      emit(state.copyWith(currState: Error()));
      return null;
    }
    emit(state.copyWith( currState: Success(),));
    return makeBook.asValue?.value;
  }


}
