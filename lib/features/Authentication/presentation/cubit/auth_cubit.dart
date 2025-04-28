
import 'package:flutter_bloc/flutter_bloc.dart';
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
    emit(state.copyWith(baseStatus: BaseStatus.loading));
    final result = await authDataSource.login(email: email, pass: pass);
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

  Future<void> register(RegisterModel model)async{
    emit(state.copyWith(baseStatus: BaseStatus.loading));
    final result = await authDataSource.register(model);
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
}
