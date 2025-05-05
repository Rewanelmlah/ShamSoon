import 'package:equatable/equatable.dart';
import 'package:shamsoon/core/shared/models/user_model.dart';
import '../../../../core/shared/base_state.dart';

enum AuthPhase { login, register, forgetPassword , resetPassword , verifyEmail , checkOtp, sendEmailVerification}

final class AuthState extends Equatable {
  final BaseStatus baseStatus;
  final AuthPhase? phase;
  final String msg;
  final UserModel? user;

  const AuthState({
    required this.baseStatus,
    this.msg = '',
    this.phase,
    this.user
  });

  factory AuthState.initial() => const AuthState(
    baseStatus: BaseStatus.initial,
    user: null,
    phase: AuthPhase.login
  );

  AuthState copyWith({
    BaseStatus? baseStatus,
    String? msg,
    AuthPhase? phase,
    UserModel? userModel,
  }) =>  AuthState(
    baseStatus: baseStatus ?? this.baseStatus,
    msg: msg ?? this.msg,
    phase: phase?? this.phase,
    user: userModel ?? this.user
  );

  @override
  List<Object?> get props => [
    baseStatus,
    phase,
    user,
    msg,
  ];
}