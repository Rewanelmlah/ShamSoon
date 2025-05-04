import 'dart:convert';
import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamsoon/core/helpers/constant_manager.dart';
import 'package:shamsoon/core/shared/models/user_model.dart';
import '../../../helpers/cache.dart';
import '../../../helpers/global_variables.dart';
import '../../../network/log_interceptor.dart';
import '../../../network/network_service.dart';

part 'user_state.dart';
part 'user_utils.dart';

const String _userKey = 'user';
const String _tokenKey = 'token';

class UserCubit extends Cubit<UserState> with UserUtils {
  UserCubit() : super(UserState.initial());

  void needActivation(){
    emit(state.copyWith(userStatus: UserStatus.needActivation));
  }

  final dioService = sl<NetworkService>(instanceName: ConstantManager.dioService);
  Future<bool> checkTokenExistOrNot()async{
    final token = await SecureStorage.read(_tokenKey);
    log('token: ${token.toString()}');
    switch(token){
      case null:
      case "":
        return false;

      default:
        dioService.setToken(token);
        return true;
    }
  }

  Future<void> setUserLoggedIn(
      {required UserModel user, required String token, required bool isRemember}) async {
    if(isRemember){
      await Future.wait([
        _saveUser(user),
        _saveToken(token),
      ]);
    }
    dioService.setToken(token);
    emit(state.copyWith(userModel: user, userStatus: UserStatus.loggedIn)); // in otp and complete profile
  }

  Future<void> logout() async {
    await Future.wait([
      CacheStorage.delete(_userKey),
      SecureStorage.delete(_tokenKey),
    ]);
    _clearUser();
  }

  Future<void> updateToken(String token) async {
    _saveToken(token);
  }

  Future<void> updateUser(UserModel user) async {
    await _saveUser(user);
    emit(state.copyWith(userModel: user));
  }

  Future<bool> init() async {
    final Map<String, dynamic>? userMap =
        CacheStorage.read(_userKey, isDecoded: true);
    final token = await SecureStorage.read(_tokenKey);

    log('userMap $userMap, token $token');
    if (token != null && userMap != null) {
      dioService.setToken(token);
      emit(state.copyWith(
        userModel: UserModel.fromJson(userMap),
        userStatus: UserStatus.loggedIn,
      ));
      return true;
    }
    return false;
  }

  void _clearUser() {
    dioService.removeToken();
    emit(UserState.initial());
  }

  UserModel get user => state.userModel;
  static UserCubit get instance  => sl<UserCubit>();

  bool get isUserLoggedIn => state.userStatus == UserStatus.loggedIn;
  bool get isActivated => state.userStatus == UserStatus.needActivation;

  Future<bool> checkSkippedOnBoarding() async{
    final bool? result = await CacheStorage.read(CacheConstants.onBoardingSubmission);
    switch(result){
      case null:
      case false:
        return false;

      default:
        return true;
    }
  }
}
