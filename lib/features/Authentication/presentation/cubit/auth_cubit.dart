import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamsoon/core/notification/notification_service.dart';
import 'package:shamsoon/features/Authentication/data/data_source.dart';
import 'package:shamsoon/features/Authentication/data/models/register.dart';
import '../../../../core/shared/base_state.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState.initial());
  final AuthDataSource authDataSource = AuthDataSourceImpl();

  Future<void> login({
    required String email,
    required String pass
})async{
    emit(state.copyWith(baseStatus: BaseStatus.loading, phase: AuthPhase.login));
    final result = await authDataSource.login(email: email, pass: pass);
    result.when(
          (success) {
            emit(state.copyWith(
              baseStatus: BaseStatus.success,
              msg: success.message,
              userModel: success.data,
            ));
          },
          (error) => emit(state.copyWith(
            baseStatus: BaseStatus.error,
            msg: error.message
          )),
    );
  }

  Future<void> register(BuildContext context, RegisterModel model)async{
    emit(state.copyWith(baseStatus: BaseStatus.loading, phase: AuthPhase.register));
    final result = await authDataSource.register(model);
    result.when(
          (success) {
            emit(state.copyWith(
                baseStatus: BaseStatus.success,
                msg: success.message,
                userModel: success.data
            ));
          },
          (error) => emit(state.copyWith(
          baseStatus: BaseStatus.error,
          msg: error.message
      )),
    );
  }

  Future<void> forgetPassword(String email)async{
    emit(state.copyWith(baseStatus: BaseStatus.loading, phase: AuthPhase.forgetPassword));
    final result = await authDataSource.forgetPassword(email);
    result.when(
          (success) => emit(state.copyWith(
          baseStatus: BaseStatus.success,
          msg: success.message,
      )),
          (error) => emit(state.copyWith(
          baseStatus: BaseStatus.error,
          msg: error.message
      )),
    );
  }

  Future<void> logout()async{
    emit(state.copyWith(baseStatus: BaseStatus.loading));
    final result = await authDataSource.logout();
    result.when(
          (success) => emit(state.copyWith(
          baseStatus: BaseStatus.success,
          msg: success.message,
      )),
          (error) => emit(state.copyWith(
          baseStatus: BaseStatus.error,
          msg: error.message
      )),
    );
  }

  Future<void> sendEmailVerification()async{
    emit(state.copyWith(baseStatus: BaseStatus.loading, phase: AuthPhase.sendEmailVerification));
    final result = await authDataSource.sendEmailVerification();
    result.when(
          (success) => emit(state.copyWith(
          // baseStatus: BaseStatus.success,
          msg: success.message
      )),
          (error) => emit(state.copyWith(
          baseStatus: BaseStatus.error,
          msg: error.message
      )),
    );
  }

  Future<void> sendOtp({
    required String email,
    required String otp
})async{
    emit(state.copyWith(baseStatus: BaseStatus.loading, phase: AuthPhase.checkOtp));
    final result = await authDataSource.sendOtp(email: email, otp: otp);
    result.when(
          (success) => emit(state.copyWith(
          baseStatus: BaseStatus.success,
          msg: success.message
      )),
          (error) => emit(state.copyWith(
          baseStatus: BaseStatus.error,
          msg: error.message
      )),
    );
  }

  Future<void> verifyEmail({
    required String email,
    required String otp
  })async{
    emit(state.copyWith(baseStatus: BaseStatus.loading, phase: AuthPhase.verifyEmail));
    final result = await authDataSource.verifyEmail(email: email, otp: otp);
    result.when(
          (success) => emit(state.copyWith(
          baseStatus: BaseStatus.success,
          msg: success.message
      )),
          (error) => emit(state.copyWith(
          baseStatus: BaseStatus.error,
          msg: error.message
      )),
    );
  }



  Future<void> resetPassword({
    required String email,
    required String password,
    required String confirmPassword,
  })async{
    emit(state.copyWith(baseStatus: BaseStatus.loading, phase: AuthPhase.resetPassword));
    final result = await authDataSource.resetPassword(
        email: email,
        password: password,
        confirmPassword: confirmPassword
    );
    result.when(
          (success) => emit(state.copyWith(
          baseStatus: BaseStatus.success,
          msg: success.message
      )),
          (error) => emit(state.copyWith(
          baseStatus: BaseStatus.error,
          msg: error.message
      )),
    );
  }

  Future<void> storeFcmToken()async{
    await authDataSource.storeFcmToken(
        NotificationService.deviceToken
    );
  }
}
