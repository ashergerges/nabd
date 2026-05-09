part of 'my_booking_cubit.dart';

@freezed
class MyBookingState with _$MyBookingState {
  const factory MyBookingState({
    BookingDetailsModel? bookDetails,
    @Default(MyBookingStateStatus.initial()) MyBookingStateStatus currState,
    @Default([]) List<BookingDetailsModel> booksUpcoming,
    @Default([]) List<BookingDetailsModel> booksCancelled,
    @Default([]) List<BookingDetailsModel> booksCompleted,
    @Default(1) int booksCompletedPage,
    @Default(1) int booksCancelledPage,
    @Default(1) int booksUpcomingPage,
    required RefreshController refreshControllerUpcoming,
    required RefreshController refreshControllerCancelled,
    required RefreshController refreshControllerCompleted,
    @Default(false) bool isShowSearch,
    @Default(2) int currentStatus,
    String? searchTerm,
}) = _MyBookingState;
}
@freezed
class MyBookingStateStatus with _$MyBookingStateStatus {
  const factory MyBookingStateStatus.initial() = Initial;
  const factory MyBookingStateStatus.loading() = Loading;
  const factory MyBookingStateStatus.error() = Error;
  const factory MyBookingStateStatus.success() = Success;
}