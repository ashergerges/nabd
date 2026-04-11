part of 'notifications_cubit.dart';

@freezed
abstract class NotificationsState with _$NotificationsState {
  const factory NotificationsState({
    required NotificationsStateStatus currentStatus,
    @Default([]) List<NotificationModel> todayNotifications,
    @Default([]) List<NotificationModel> earlyNotifications,
    required ScrollController scrollController,
    @Default(1) int pageNumber,
  }) = _NotificationsState;
}

@freezed
class NotificationsStateStatus with _$NotificationsStateStatus {
  const factory NotificationsStateStatus.initial() = Initial;

  const factory NotificationsStateStatus.getNotificationsLoading() = GetNotificationsLoading;

  const factory NotificationsStateStatus.getNotificationsSuccess() = GetNotificationsSuccess;

  const factory NotificationsStateStatus.getNotificationsError() = GetNotificationsError;

  const factory NotificationsStateStatus.getMoreNotificationsSuccess() =
      GetMoreNotificationsSuccess;

  const factory NotificationsStateStatus.getMoreNotificationsError() = GetMoreNotificationsError;

  const factory NotificationsStateStatus.markNotificationAsReadSuccess() =
      MarkNotificationAsReadSuccess;

  const factory NotificationsStateStatus.markNotificationAsReadError() =
      MarkNotificationAsReadError;
}
