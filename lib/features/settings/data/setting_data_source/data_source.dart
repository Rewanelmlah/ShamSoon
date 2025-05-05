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
  // المفروض تحط التايب عشان هيرجعلك وتحطه فالuser model ألجديد
  Future<Result<BaseModel<UserModel>, Failure>> updateProfile({
    required String name,
    required String email,
    required String phone
  });
  // Future<BaseModel> deleteAccount();
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
          phoneNumber: json['phoneNumber'],
          email: json['email'],
      ),
    ).handleCallbackWithFailure();

    return result;
  }

}