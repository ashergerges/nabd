import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_state.dart';
part 'book_cubit.freezed.dart';

class BookCubit extends Cubit<BookState> {
  BookCubit() : super(const BookState());

  void currentStep(int value){
    emit(state.copyWith(currentStep: value));
  }
}
