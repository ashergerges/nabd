import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nawy/core/services/notification/notifications_service.dart';
import '../../../main_common.dart';
import '../data/models/notification_model.dart';
import '../data/repositories/interfaces/i_notifications_repository.dart';

part 'notifications_state.dart';

part 'notifications_cubit.freezed.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  final INotificationsRepository notificationsRepository;
  final NotificationService notificationService;

  NotificationsCubit()
      : notificationsRepository = getIt<INotificationsRepository>(),
        notificationService = getIt<NotificationService>(),
        super(NotificationsState(
          currentStatus: const NotificationsStateStatus.initial(),
          scrollController: ScrollController(),
        ));

}
