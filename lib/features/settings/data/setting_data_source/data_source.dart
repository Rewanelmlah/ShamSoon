import 'package:multiple_result/multiple_result.dart';
import 'package:shamsoon/core/error/failure.dart';
import 'package:shamsoon/core/extensions/error_handler_extension.dart';
import 'package:shamsoon/core/helpers/constant_manager.dart';
import 'package:shamsoon/core/network/api_endpoints.dart';
import 'package:shamsoon/core/network/network_request.dart';
import 'package:shamsoon/core/network/network_service.dart';
import 'package:shamsoon/core/shared/base_model.dart';
import 'package:shamsoon/core/shared/cubits/user_cubit/user_cubit.dart';
import '../../../../core/helpers/global_variables.dart';
import '../../../../core/shared/models/user_model.dart';

abstract interface class SettingDataSource{
  Future<Result<BaseModel, Failure>> deleteAccount({
    required String password,
    required String passwordConfirm
  });
  Future<Result<BaseModel, Failure>> logout();

  Future<Result<BaseModel<UserModel>, Failure>> updateProfile({
    required String name,
    required String email,
    required String phone
  });
  Future<Result<BaseModel, Failure>> feedback({
    required String msg
  });

  Future<Result<BaseModel, Failure>> changeNotify(bool isNotify);
}

class SettingDataSourceImpl implements SettingDataSource{
  @override
  Future<Result<BaseModel<UserModel>, Failure>> updateProfile({
    required String name,
    required String email,
    required String phone
}) async{
    final result = await sl<NetworkService>(instanceName: ConstantManager.dioService).callApi<UserModel>(
        NetworkRequest(
          method: RequestMethod.patch,
          path: ApiConstants.profile,
          body: {'username' : name, 'email' : email, 'phone' : phone},
        ),
      mapper: (json) => UserCubit.instance.user.copyWith(
          id: json['id'],
          fullName: json['username'],
          phoneNumber: json['phone'],
          email: json['new_email'],
      ),
    ).handleCallbackWithFailure();

    return result;
  }

  @override
  Future<Result<BaseModel, Failure>> feedback({required String msg}) async{
    final result = await sl<NetworkService>(instanceName: ConstantManager.dioService)
        .callApi(
        NetworkRequest(
          method: RequestMethod.post,
          path: ApiConstants.feedback,
          body: {
            'name' : UserCubit.instance.user.fullName,
            'phone' : UserCubit.instance.user.phoneNumber,
            'message' : msg
          },
        ),
    ).handleCallbackWithFailure();

    return result;
  }

  @override
  Future<Result<BaseModel, Failure>> deleteAccount({
    required String password,
    required String passwordConfirm
}) async{
    final result = await sl<NetworkService>(instanceName: ConstantManager.dioService).callApi(
        NetworkRequest(
          method: RequestMethod.delete,
          path: ApiConstants.profile,
          body: {'password' : password, 'password_confirmation' : passwordConfirm},
        ),
    ).handleCallbackWithFailure();
    return result;
  }

  @override
  Future<Result<BaseModel, Failure>> logout() async{
    final result = await sl<NetworkService>(instanceName: ConstantManager.dioService).callApi(
      NetworkRequest(
        method: RequestMethod.post,
        path: ApiConstants.logout,
      ),
    ).handleCallbackWithFailure();
    return result;
  }

  @override
  Future<Result<BaseModel, Failure>> changeNotify(bool isNotify) async{
    final result = await sl<NetworkService>(instanceName: ConstantManager.dioService).callApi(
        NetworkRequest(
          method: RequestMethod.post,
          path: ApiConstants.changeNotify,
          body: {'is_notify' : isNotify},
        ),
    ).handleCallbackWithFailure();
    return result;
  }
}
