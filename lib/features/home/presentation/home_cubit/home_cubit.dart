import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamsoon/core/shared/base_state.dart';
import 'package:shamsoon/features/home/data/data_source/repo/repo.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeState.initial());
  HomeRepo homeRepo;

  Future<void> getCarbons() async {
    emit(state.copyWith(baseStatus: BaseStatus.loading));
    final result = await homeRepo.getCarbons();
    result.when(
      (success) => emit(state.copyWith(
        baseStatus: BaseStatus.success,
        carbon: success.data,
      )),
      (error) => emit(state.copyWith(
        baseStatus: BaseStatus.error,
        msg: error.message,
      )),
    );
  }
}
