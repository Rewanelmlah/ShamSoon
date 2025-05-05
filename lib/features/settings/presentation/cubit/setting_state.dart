import 'package:equatable/equatable.dart';
import 'package:shamsoon/core/shared/models/user_model.dart';

import '../../../../core/shared/base_state.dart';
import '../../../../core/shared/cubits/user_cubit/user_cubit.dart';

final class SettingState extends Equatable {
  final BaseStatus baseStatus;
  final String msg;
  final UserModel? user;

  const SettingState({
    required this.baseStatus,
    this.msg = '',
    this.user
  });

  factory SettingState.initial() => SettingState(
    baseStatus: BaseStatus.initial,
    msg: '',
    user: UserCubit.instance.user
  );

  SettingState copyWith({
    BaseStatus? baseStatus,
    String? msg,
    UserModel? user
  }) =>  SettingState(
    baseStatus: baseStatus ?? this.baseStatus,
    msg: msg ?? this.msg,
    user: user ?? this.user
  );

  @override
  List<Object?> get props => [
    baseStatus,
    user,
    msg,
  ];
}