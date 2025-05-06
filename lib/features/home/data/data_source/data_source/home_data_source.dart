import 'dart:io';
import 'package:shamsoon/core/network/api_endpoints.dart';
import 'package:shamsoon/core/network/network_request.dart';
import 'package:shamsoon/core/network/network_service.dart';
import 'package:shamsoon/core/shared/base_model.dart';
import 'package:shamsoon/features/home/data/data_source/models/carbon.dart';
import 'package:shamsoon/features/home/data/data_source/models/prediction_response.dart';

import '../../../../../core/helpers/constant_manager.dart';
import '../../../../../core/helpers/global_variables.dart';

abstract interface class HomeDataSource{
  Future<BaseModel<PredictionResponse>> sendSolarPanelToMakeAnalysis(File? image);
  Future<BaseModel<Carbon>> getCarbon();
}

class HomeDataSourceImpl extends HomeDataSource{
  @override
  Future<BaseModel<PredictionResponse>> sendSolarPanelToMakeAnalysis(File? image) async{
    final result = sl<NetworkService>(instanceName: ConstantManager.aiService).callApi<PredictionResponse>(
        NetworkRequest(
          method: RequestMethod.post,
          path: ApiConstants.predict,
          isFormData: true,
          body: {'file' : image}
        ),
      mapper: (json) => PredictionResponse.fromJson(json),
    );

    return result;
  }

  @override
  Future<BaseModel<Carbon>> getCarbon() async{
    final result = await sl<NetworkService>(instanceName: ConstantManager.dioService).callApi(
        NetworkRequest(
            method: RequestMethod.get,
            path: ApiConstants.carbons
        ),
      mapper: (json) => Carbon.fromJson(json),
    );
    return result;
  }
}