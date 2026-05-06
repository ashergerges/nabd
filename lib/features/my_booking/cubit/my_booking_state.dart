part of 'my_booking_cubit.dart';

@freezed
class MyBookingState with _$MyBookingState {
  const factory MyBookingState({
    BookingDetailsModel? bookDetails,
    @Default(MyBookingStateStatus.initial()) MyBookingStateStatus currState,

}) = _MyBookingState;
}
@freezed
class MyBookingStateStatus with _$MyBookingStateStatus {
  const factory MyBookingStateStatus.initial() = Initial;
  const factory MyBookingStateStatus.loading() = Loading;
  const factory MyBookingStateStatus.error() = Error;
  const factory MyBookingStateStatus.success() = Success;
}