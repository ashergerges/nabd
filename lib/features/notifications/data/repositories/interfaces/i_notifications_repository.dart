import 'package:async/async.dart';
import '../../models/notification_model.dart';

abstract class INotificationsRepository {
  Future<Result<List<NotificationModel>>> getNotifications(
      {required int pageNumber, required int pageSize});

  Future<Result<bool>> markNotificationRead({required String notificationId});

  Future<Result<bool>> addFcmTokenToServer({required String fcmToken});

  Future<Result<bool>> removeFcmTokenFromServer({required String fcmToken});

  Future<Result<int>> getUnReadNotificationsCount();

  Future<Result<String>> updateAllReadNotifications();

  Future<Result<bool>> deleteNotification({required String notificationId});

  Future<Result<bool>> deleteAllNotifications();
}
