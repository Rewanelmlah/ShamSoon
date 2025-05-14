import 'package:equatable/equatable.dart';

import '../../../../core/shared/base_state.dart';

final class NotificationState extends Equatable {
  final BaseStatus baseStatus;
  final String msg;
  final int? notificationCount;

  const NotificationState({
    required this.baseStatus,
    this.msg = '',
    this.notificationCount
  });

  factory NotificationState.initial() => const NotificationState(
    baseStatus: BaseStatus.initial,
    msg: '',
    notificationCount: 0
  );

  NotificationState copyWith({
    BaseStatus? baseStatus,
    String? msg,
    int? notificationCount
  }) =>  NotificationState(
    baseStatus: baseStatus ?? this.baseStatus,
    msg: msg ?? this.msg,
    notificationCount: notificationCount ?? this.notificationCount
  );

  @override
  List<Object?> get props => [
    baseStatus,
    msg,
    notificationCount
  ];
}