import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nawy/core/services/dialogs/message_service.dart';
import 'package:nawy/features/my_booking/data/models/booking_details_model.dart';
import 'package:nawy/features/my_booking/data/repositories/interfaces/i_my_booking_repository.dart';
import 'package:nawy/main_common.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'my_booking_state.dart';
part 'my_booking_cubit.freezed.dart';

class MyBookingCubit extends Cubit<MyBookingState> {
  MyBookingCubit() :
        _repository=getIt<IMyBookingRepository>(),

        super( MyBookingState(
          refreshControllerCancelled: RefreshController(),
          refreshControllerCompleted: RefreshController(),
          refreshControllerUpcoming:RefreshController()
      ));


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
  Future<void> sendRate({
    required int bookId,
    required int score,
    String? comment,
  }) async {
    emit(state.copyWith(currState: Loading()));

    var sendRate = await _repository.sendRate(
      bookId: bookId,
      score: score,
      comment: comment,
    );

    if (sendRate.isError) {
      MessageService.showToast(
        msg: sendRate.asError?.error.toString() ?? "",
        state: ToastStates.error,
      );
      emit(state.copyWith(currState: Error()));
      return;
    }

    MessageService.showToast(
      msg: sendRate.asValue?.value.toString() ?? "",
      state: ToastStates.success,
    );

    // Update the specific booking to mark it as reviewed
    final updatedBookings = state.booksCompleted.map((booking) {
      if (booking.id == bookId) {
        return booking.copyWith(isReviewed: true);
      }
      return booking;
    }).toList();

    emit(state.copyWith(
      currState: Success(),
      booksCompleted: updatedBookings,
    ));
  }


  // Booking Status Types
  // Upcoming status: 2
  // Completed status: 3
  // Cancelled status: 4

  // Determine if we can skip loading (data exists and not pulling to refresh)
  bool canLoadData({bool isPulling = false, required int status}) {
    final bool hasItems = switch (status) {
      2 => state.booksUpcoming.isNotEmpty,
      3 => state.booksCompleted.isNotEmpty,
      4 => state.booksCancelled.isNotEmpty,
      _ => false,
    };

    return hasItems && !isPulling;
  }

  // Determine if we should show loading state
  bool isLoadData({required int status, required bool isPulling}) {
    final bool hasItems = switch (status) {
      2 => state.booksUpcoming.isEmpty,
      3 => state.booksCompleted.isEmpty,
      4 => state.booksCancelled.isEmpty,
      _ => true,
    };

    return hasItems || isPulling;
  }

  // Update state with fresh data (first page)
  void emitBookingUpdate(int status, List<BookingDetailsModel> bookings) {
    final updatedState = switch (status) {
      2 => state.copyWith(
        currState: Success(),
        booksUpcoming: bookings,
        booksUpcomingPage: 1,
          currentStatus: 2
      ),
      3 => state.copyWith(
        currState: Success(),
        booksCompleted: bookings,
        booksCompletedPage: 1,
          currentStatus: 3
      ),
      4 => state.copyWith(
        currState: Success(),
        booksCancelled: bookings,
        booksCancelledPage: 1,
          currentStatus: 4

      ),
      _ => state,
    };

    emit(updatedState);
  }

  // Update state with additional data (pagination)
  void emitMoreBookingUpdate(int status, List<BookingDetailsModel> bookings) {
    final updatedState = switch (status) {
      2 => state.copyWith(
        currState: Success(),
        booksUpcoming: state.booksUpcoming + bookings,
        booksUpcomingPage: state.booksUpcomingPage + 1,
      ),
      3 => state.copyWith(
        currState: Success(),
        booksCompleted: state.booksCompleted + bookings,
        booksCompletedPage: state.booksCompletedPage + 1,
      ),
      4 => state.copyWith(
        currState: Success(),
        booksCancelled: state.booksCancelled + bookings,
        booksCancelledPage: state.booksCancelledPage + 1,
      ),
      _ => state,
    };

    emit(updatedState);
  }

  // Get refresh controller based on status
  RefreshController _getRefreshController(int status) {
    return switch (status) {
      2 => state.refreshControllerUpcoming,
      3 => state.refreshControllerCompleted,
      4 => state.refreshControllerCancelled,
      _ => state.refreshControllerUpcoming,
    };
  }

  // Generic method to fetch bookings
  Future<void> getBookings({
    bool isPull = false,
    required int status,
  }) async {
    if (canLoadData(isPulling: isPull, status: status)) return;

    if (isLoadData(status: status, isPulling: isPull)) {
      emit(state.copyWith(currState: Loading()));
    }

    var response = await _repository.myBook(
      status: status,
      page: 1,
    );

    final refreshController = _getRefreshController(status);

    if (response.isError) {
      refreshController.refreshFailed();
      MessageService.showToast(
        msg: response.asError?.error.toString() ?? '',
        state: ToastStates.error,
      );
      emit(state.copyWith(currState: Error()));
      return;
    }

    refreshController.refreshCompleted();
    emitBookingUpdate(status, response.asValue?.value ?? []);
  }

  // Generic method to load more bookings
  Future<void> moreBookings({required int status}) async {
    final currentPage = switch (status) {
      2 => state.booksUpcomingPage,
      3 => state.booksCompletedPage,
      4 => state.booksCancelledPage,
      _ => 1,
    };

    var response = await _repository.myBook(
      status: status,
      page: currentPage + 1,
    );

    final refreshController = _getRefreshController(status);

    if (response.isError) {
      MessageService.showToast(
        msg: response.asError?.error.toString() ?? '',
        state: ToastStates.error,
      );
      refreshController.loadFailed();
      emit(state.copyWith(currState: Error()));
      return;
    }

    final bookings = response.asValue?.value ?? [];

    if (bookings.isEmpty) {
      // No more data available
      refreshController.loadNoData();
      return;
    }

    emitMoreBookingUpdate(status, bookings);
    refreshController.loadComplete();
  }

  // Convenience methods for each booking type
  Future<void> booksUpcoming({bool isPull = false}) async {
    await getBookings(isPull: isPull, status: 2);
  }

  Future<void> booksUpcomingMore() async {
    await moreBookings(status: 2);
  }

  Future<void> booksCompleted({bool isPull = false}) async {
    await getBookings(isPull: isPull, status: 3);
  }

  Future<void> booksCompletedMore() async {
    await moreBookings(status: 3);
  }

  Future<void> booksCancelled({bool isPull = false}) async {
    await getBookings(isPull: isPull, status: 4);
  }

  Future<void> booksCancelledMore() async {
    await moreBookings(status: 4);
  }

  void setShowedSearch(bool showSearch){
    emit(state.copyWith(isShowSearch: showSearch,));
  }
  Timer? _searchDebounce;
  Future<void> setSearchTerm(String? searchTerm) async {
    emit(state.copyWith(searchTerm: searchTerm));

    // Cancel previous timer
    _searchDebounce?.cancel();

    if (searchTerm == null || searchTerm.isEmpty) {
      // Clear search immediately
      await getBookings(isPull: false, status: state.currentStatus);
      return;
    }

    // Debounce search by 500ms
    _searchDebounce = Timer(const Duration(milliseconds: 500), () {
      searchBookings(searchTerm: searchTerm, status: state.currentStatus);
    });
  }



  Future<void> searchBookings({
    required String searchTerm,
    required int status,
  }) async {
    emit(state.copyWith(currState: Loading()));

    var response = await _repository.myBook(
      status: status,
      search: searchTerm,
      page: 1,
    );

    if (response.isError) {
      MessageService.showToast(
        msg: response.asError?.error.toString() ?? '',
        state: ToastStates.error,
      );
      emit(state.copyWith(currState: Error()));
      return;
    }

    emitBookingUpdate(status, response.asValue?.value ?? []);
  }
  @override
  Future<void> close() {
    _searchDebounce?.cancel();
    return super.close();
  }


}
