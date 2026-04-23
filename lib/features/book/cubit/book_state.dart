part of 'book_cubit.dart';

@freezed
class BookState with _$BookState {
  const factory BookState({
    @Default(0) int currentStep,
  }) = _Initial;
}
