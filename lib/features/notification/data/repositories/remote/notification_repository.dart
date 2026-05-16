// ignore: implementation_imports, depend_on_referenced_packages
import 'dart:developer';

import 'package:async/async.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';
import 'package:nawy/core/services/network/network_service.dart';
import 'package:nawy/core/utils/constants/constants.dart';
import 'package:nawy/features/auth/data/models/login_response_body.dart';
import 'package:nawy/features/home/data/models/home_response.dart';
import 'package:nawy/features/notification/cubit/notification_cubit.dart';
import 'package:nawy/features/notification/data/models/notification_group_model.dart';
import 'package:nawy/features/profile/data/models/fav/fav_package_model.dart';
import 'package:nawy/features/profile/data/models/fav/fav_vendor_model.dart';
import 'package:nawy/features/vendor_details/data/models/vendor_details_model.dart';
import 'package:nawy/features/venues/data/models/product_model.dart';

import '../interfaces/i_notification_repository.dart';

@Injectable(as: INotificationRepository)
class NotificationRepository implements INotificationRepository {
  final NetworkService networkService;

  NotificationRepository({required this.networkService});

  @override
  Future<Result<List<NotificationGroupModel>>> notification()async {
    var response = await networkService.getAsync(
        url: AppStrings.urls.notificationUrl,
    );
    if (response.isError) return Result.error(response.asError!.error);


    List<NotificationGroupModel> notification = List<NotificationGroupModel>.from(
        response.asValue?.value.data['data']['notifications'].map((x) => NotificationGroupModel.fromJson(x)));

    return Result.value(notification );
  }
}
