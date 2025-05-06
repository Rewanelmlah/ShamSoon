import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamsoon/features/settings/data/setting_data_source/data_source.dart';
import 'package:shamsoon/features/settings/presentation/cubit/setting_state.dart';

import '../../../../core/shared/base_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingState.initial());

  final SettingDataSource settingDataSource = SettingDataSourceImpl();
  Future<void> updateProfile({
    required String name,
    required String email,
    required String phone
})async{
    emit(state.copyWith(baseStatus: BaseStatus.loading));
    final result = await settingDataSource.updateProfile(name: name, email: email, phone: phone);
    result.when(
        (success) => emit(state.copyWith(
            baseStatus: BaseStatus.success,
            msg: success.message,
            user: success.data
        )),
        (error) => emit(state.copyWith(
            baseStatus: BaseStatus.error,
            msg: error.message
        ))
    );
  }

  Future<void> feedback({required String msg})async{
    emit(state.copyWith(baseStatus: BaseStatus.loading));
    final result = await settingDataSource.feedback(msg: msg);
    result.when(
        (success) => emit(state.copyWith(
            baseStatus: BaseStatus.success,
            msg: success.message
        )),
        (error) => emit(state.copyWith(
            baseStatus: BaseStatus.error,
            msg: error.message
        ))
    );
  }
}
