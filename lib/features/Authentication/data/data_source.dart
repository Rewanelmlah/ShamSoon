import 'package:multiple_result/multiple_result.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:shamsoon/core/error/failure.dart';
import 'package:shamsoon/core/error/failure.dart';
import 'package:shamsoon/core/extensions/error_handler_extension.dart';
import 'package:shamsoon/core/helpers/constant_manager.dart';
import 'package:shamsoon/core/network/api_endpoints.dart';
import 'package:shamsoon/core/network/network_request.dart';
import 'package:shamsoon/core/network/network_service.dart';
import 'package:shamsoon/core/shared/base_model.dart';
import 'package:shamsoon/features/Authentication/data/models/register.dart';

import '../../../core/helpers/global_variables.dart';

abstract interface class AuthDataSource{
  Future<Result<BaseModel<void>, Failure>> login({
    required String email,
    required String pass,
  });

  Future<Result<BaseModel<void>, Failure>> register(RegisterModel model);
}

class AuthDataSourceImpl implements AuthDataSource{
  final NetworkService authDataSource = sl<NetworkService>(instanceName: ConstantManager.dioService);
  @override
  Future<Result<BaseModel<void>, Failure>> login({required String email, required String pass}) async{
    return authDataSource.callApi(
        NetworkRequest(
          method: RequestMethod.post,
          path: ApiConstants.login,
          body: {
            'email': email,
            'password': pass
          }
        )
    ).handleCallbackWithFailure();
  }

  @override
  Future<Result<BaseModel<void>, Failure>> register(RegisterModel model) async{
    return authDataSource.callApi(
        NetworkRequest(
            method: RequestMethod.post,
            path: ApiConstants.register,
            body: model.toJson(),
        )
    ).handleCallbackWithFailure();
  }
}