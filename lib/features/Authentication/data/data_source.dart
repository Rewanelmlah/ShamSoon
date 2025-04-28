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

import '../../../core/helpers/global_variables.dart';

abstract interface class AuthDataSource{
  Future<Result<BaseModel<void>, Failure>> login({
    required String email,
    required String pass,
  });
}

class AuthDataSourceImpl implements AuthDataSource{
  @override
  Future<Result<BaseModel<void>, Failure>> login({required String email, required String pass}) async{
    return sl<NetworkService>(instanceName: ConstantManager.dioService).callApi(
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
}