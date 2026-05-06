part of 'book_cubit.dart';

@freezed
class BookState with _$BookState {
  const factory BookState({
    @Default(0) int currentStep,
    @Default([]) List<String> availableSlots,
    @Default([]) List<PaymentMethodModel> paymentMethods,
    BookingRequestModel? bookRequest,
    @Default(BookStateStatus.initial()) BookStateStatus currState,

  }) = _BookState;
}
@freezed
class BookStateStatus with _$BookStateStatus {
  const factory BookStateStatus.initial() = Initial;
  const factory BookStateStatus.loading() = Loading;
  const factory BookStateStatus.error() = Error;
  const factory BookStateStatus.success() = Success;
}