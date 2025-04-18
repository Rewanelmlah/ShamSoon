import 'dart:io';
import 'package:multiple_result/multiple_result.dart';
import 'package:shamsoon/core/error/failure.dart';
import 'package:shamsoon/core/extensions/error_handler_extension.dart';
import 'package:shamsoon/core/shared/base_model.dart';
import 'package:shamsoon/features/home/data/data_source/data_source/home_data_source.dart';
import 'package:shamsoon/features/home/data/data_source/models/prediction_response.dart';

abstract interface class HomeRepo {
  Future<Result<BaseModel<PredictionResponse>, Failure>> sendSolarPanelToMakeAnalysis(File? image);
}

class HomeRepoImpl extends HomeRepo{
  HomeDataSource homeDataSource;
  HomeRepoImpl(this.homeDataSource);

  @override
  Future<Result<BaseModel<PredictionResponse>, Failure>> sendSolarPanelToMakeAnalysis(File? image) async{
    return homeDataSource.sendSolarPanelToMakeAnalysis(image).handleCallbackWithFailure();

  }
}