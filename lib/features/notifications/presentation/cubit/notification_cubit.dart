
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamsoon/core/shared/base_state.dart';

import '../../../../core/widgets/easy_pagination.dart';
import '../../data/data_source.dart';
import '../../data/models/notification_model.dart';
import 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationState.initial());

  final EasyPaginationController<NotificationModel> controller = EasyPaginationController();

  final NotificationDataSource notificationDataSource = NotificationDataSource();
  Future<void> deleteSpecificNotification({
    required int index,
    required NotificationModel notification
})async{
    controller.removeWhere((item) => item.id == notification.id);
  final result = await notificationDataSource.deleteSpecificNotification(notification.id!);
    result.when((success) => emit(
        state.copyWith(
            baseStatus: BaseStatus.success,
            msg: success.message
        )),
          (error) {
            emit(
                state.copyWith(
                    baseStatus: BaseStatus.success,
                    msg: error.message
                ));
            controller.addItemAt(index, notification);
          },);
  }

  Future<void> deleteAllNotifications()async{
    final result = await notificationDataSource.deleteAllNotification();
    result.when((success) => emit(
        state.copyWith(
            baseStatus: BaseStatus.success,
            msg: success.message
        )),
          (error) => emit(
          state.copyWith(
              baseStatus: BaseStatus.success,
              msg: error.message
          )),);
  }

  Future<void> getNotificationsCount()async{
    final result = await notificationDataSource.getNotificationsCount();
    result.when((success) => emit(
        state.copyWith(
            baseStatus: BaseStatus.success,
            msg: success.message,
          notificationCount: success.data
        )),
          (error) => emit(
          state.copyWith(
              baseStatus: BaseStatus.success,
              msg: error.message
          )),);
  }
}
