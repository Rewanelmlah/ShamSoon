import 'package:multiple_result/multiple_result.dart';
import 'package:shamsoon/core/error/failure.dart';
import 'package:shamsoon/core/extensions/error_handler_extension.dart';
import 'package:shamsoon/core/helpers/constant_manager.dart';
import 'package:shamsoon/core/network/api_endpoints.dart';
import 'package:shamsoon/core/network/network_request.dart';
import 'package:shamsoon/core/network/network_service.dart';
import 'package:shamsoon/core/shared/base_model.dart';
import 'package:shamsoon/core/shared/models/user_model.dart';
import 'package:shamsoon/features/Authentication/data/models/register.dart';

import '../../../core/helpers/global_variables.dart';

abstract interface class AuthDataSource{
  Future<Result<BaseModel<void>, Failure>> login({
    required String email,
    required String pass,
  });

  Future<Result<BaseModel<UserModel>, Failure>> register(RegisterModel model);
  Future<Result<BaseModel<void>, Failure>> forgetPassword(String email);
  Future<Result<BaseModel<void>, Failure>> logout();
  Future<Result<BaseModel<void>, Failure>> sendOtp({
    required String email,
    required String otp
  });

  Future<Result<BaseModel<void>, Failure>> verifyEmail({
    required String email,
    required String otp
  });

  Future<Result<BaseModel<void>, Failure>> resetPassword({
    required String email,
    required String password,
    required String confirmPassword,
  });
  Future<Result<BaseModel<void>, Failure>> sendEmailVerification();
}

class AuthDataSourceImpl implements AuthDataSource{
  final NetworkService authDataSource = sl<NetworkService>(instanceName: ConstantManager.dioService);

  @override
  Future<Result<BaseModel<void>, Failure>> login({required String email, required String pass}) async{
    return await authDataSource.callApi(
        NetworkRequest(
          method: RequestMethod.post,
          path: ApiConstants.login,
          body: {
            'email': email,
            'password': pass
          },
        )
    ).handleCallbackWithFailure();
  }

  @override
  Future<Result<BaseModel<UserModel>, Failure>> register(RegisterModel model) async{
    return await authDataSource.callApi<UserModel>(
        NetworkRequest(
            method: RequestMethod.post,
            path: ApiConstants.register,
            body: model.toJson(),
        ),
      mapper: (json) => UserModel.fromJson(json),
    ).handleCallbackWithFailure();
  }

  @override
  Future<Result<BaseModel<void>, Failure>> forgetPassword(String email) async{
    return await authDataSource.callApi(
        NetworkRequest(
          method: RequestMethod.post,
          path: ApiConstants.forgetPassword,
          body: {'email' : email},
        )
    ).handleCallbackWithFailure();
  }

  @override
  Future<Result<BaseModel<void>, Failure>> logout() async{
    return await authDataSource.callApi(
        NetworkRequest(
          method: RequestMethod.post,
          path: ApiConstants.logout,
        )
    ).handleCallbackWithFailure();
  }

  @override
  Future<Result<BaseModel<void>, Failure>> sendOtp({
    required String email,
    required String otp
}) async{
    return await authDataSource.callApi(
        NetworkRequest(
          method: RequestMethod.post,
          path: ApiConstants.checkOtp,
          body: {'email' : email, 'otp' : otp},
        )
    ).handleCallbackWithFailure();
  }

  @override
  Future<Result<BaseModel<void>, Failure>> verifyEmail({
    required String email,
    required String otp
  }) async{
    return await authDataSource.callApi(
        NetworkRequest(
          method: RequestMethod.post,
          path: ApiConstants.verifyEmail,
          body: {'email' : email, 'otp' : otp},
        )
    ).handleCallbackWithFailure();
  }

  @override
  Future<Result<BaseModel<void>, Failure>> resetPassword({
    required String email,
    required String password,
    required String confirmPassword,
  }) async{
    return await authDataSource.callApi(
        NetworkRequest(
          method: RequestMethod.post,
          path: ApiConstants.checkOtp,
          body: {'email' : email, 'password' : password, 'confirm_password' : confirmPassword},
        )
    ).handleCallbackWithFailure();
  }

  @override
  Future<Result<BaseModel<void>, Failure>> sendEmailVerification() async{
    return await authDataSource.callApi(
        NetworkRequest(
          method: RequestMethod.post,
          path: ApiConstants.sendEmailVerification,
        )
    ).handleCallbackWithFailure();
  }
}