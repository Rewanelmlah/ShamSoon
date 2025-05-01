import 'package:equatable/equatable.dart';
import 'package:shamsoon/core/shared/models/user_model.dart';
import '../../../../core/shared/base_state.dart';

final class AuthState extends Equatable {
  final BaseStatus baseStatus;
  final String msg;
  final UserModel? user;

  const AuthState({
    required this.baseStatus,
    this.msg = '',
    this.user
  });

  factory AuthState.initial() => AuthState(
    baseStatus: BaseStatus.initial,
    user: UserModel.initial()
  );

  AuthState copyWith({
    BaseStatus? baseStatus,
    String? msg,
    UserModel? userModel,
  }) =>  AuthState(
    baseStatus: baseStatus ?? this.baseStatus,
    msg: msg ?? this.msg,
    user: userModel ?? this.user
  );

  @override
  List<Object?> get props => [
    baseStatus,
    user,
    msg,
  ];
}