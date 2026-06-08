// ignore: depend_on_referenced_packages
import 'package:async/async.dart';
import 'package:nabd/features/notification/cubit/notification_cubit.dart';
import 'package:nabd/features/notification/data/models/notification_group_model.dart';

import '../../../../common/data/local/models/app_user.dart';
abstract class INotificationRepository {
  Future<Result<List<NotificationGroupModel>>> notification();


}
