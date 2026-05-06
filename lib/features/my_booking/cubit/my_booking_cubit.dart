import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nawy/core/services/dialogs/message_service.dart';
import 'package:nawy/features/book/data/model/booking_request_model.dart';
import 'package:nawy/features/my_booking/data/models/booking_details_model.dart';
import 'package:nawy/features/my_booking/data/repositories/interfaces/i_my_booking_repository.dart';
import 'package:nawy/main_common.dart';

part 'my_booking_state.dart';
part 'my_booking_cubit.freezed.dart';

class MyBookingCubit extends Cubit<MyBookingState> {
  MyBookingCubit() :
        _repository=getIt<IMyBookingRepository>(),

      super(const MyBookingState());

  final IMyBookingRepository _repository;

  Future<void> bookDetails({ required int bookId,}) async {
    emit(state.copyWith(currState: Loading()));

    var bookDetails = await _repository.bookDetails(bookId:bookId);
    if (bookDetails.isError) {
      MessageService.showToast(
        msg: bookDetails.asError?.error.toString() ?? "",
        state: ToastStates.error,
      );
      emit(state.copyWith(currState: Error()));

      return;
    }
    emit(state.copyWith( currState: Success(),bookDetails:bookDetails.asValue?.value));
    return;
  }


}
