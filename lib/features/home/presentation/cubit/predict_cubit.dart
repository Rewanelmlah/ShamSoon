import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamsoon/core/shared/base_state.dart';
import 'package:shamsoon/features/home/data/data_source/repo/repo.dart';
import 'package:shamsoon/features/home/presentation/cubit/predict_state.dart';

class PredictCubit extends Cubit<PredictState> {
  PredictCubit(this.repo) : super(PredictState.initial());
  HomeRepo repo;


  Future<void> sendImageToAi(File? image)async{
    emit(state.copyWith(baseStatus: BaseStatus.loading));
    final result = await repo.sendSolarPanelToMakeAnalysis(image);
    result.when(
          (success) => emit(state.copyWith(
              baseStatus: BaseStatus.success,
              msg: 'Predicted Successfully',
              predictionStatus: success.data.predictedClass,
              selectedImage: image
          )),
          (error) => emit(
              state.copyWith(
                baseStatus: BaseStatus.error,
                msg: error.message,
                selectedImage: image
              )),
    );
  }
}
