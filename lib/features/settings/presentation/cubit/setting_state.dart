import 'package:equatable/equatable.dart';
import 'package:shamsoon/core/shared/models/user_model.dart';

import '../../../../core/shared/base_state.dart';
import '../../../../core/shared/cubits/user_cubit/user_cubit.dart';

enum SheetType { logout, deleteAccount }
final class SettingState extends Equatable {
  final BaseStatus baseStatus;
  final String msg;
  final UserModel? user;
  final SheetType? type;

  const SettingState({
    required this.baseStatus,
    this.msg = '',
    this.type,
    this.user
  });

  factory SettingState.initial() => SettingState(
    baseStatus: BaseStatus.initial,
    msg: '',
    type: SheetType.logout,
    user: UserCubit.instance.user
  );

  SettingState copyWith({
    BaseStatus? baseStatus,
    String? msg,
    SheetType? type,
    UserModel? user
  }) =>  SettingState(
    baseStatus: baseStatus ?? this.baseStatus,
    msg: msg ?? this.msg,
    user: user ?? this.user,
    type: type ?? this.type
  );

  @override
  List<Object?> get props => [
    baseStatus,
    type,
    user,
    msg,
  ];
}