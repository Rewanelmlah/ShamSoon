import 'dart:convert';
import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../helpers/cache.dart';
import '../../../helpers/global_variables.dart';
import '../../../network/log_interceptor.dart';
import '../../../network/network_service.dart';
import '../../models/user_data.dart';

part 'user_state.dart';
part 'user_utils.dart';

const String _userKey = 'user';
const String _tokenKey = 'token';

class UserCubit extends Cubit<UserState> with UserUtils {
  UserCubit() : super(UserState.initial());

  void needActivation(){
    emit(state.copyWith(userStatus: UserStatus.needActivation));
  }

  Future<bool> checkTokenExistOrNot()async{
    final token = await SecureStorage.read(_tokenKey);
    log('token: ${token.toString()}');
    switch(token){
      case null:
      case "":
        return false;

      default:
        sl<NetworkService>().setToken(token);
        return true;
    }
  }

  Future<void> setUserLoggedIn(
      {required UserData user, required String token}) async {
    await Future.wait([
      _saveUser(user),
      _saveToken(token),
    ]);
    sl<NetworkService>().setToken(token);
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

  Future<void> updateUser(UserData user) async {
    await _saveUser(user);
    emit(state.copyWith(userModel: user));
  }

  Future<bool> init() async {
    final Map<String, dynamic>? userMap =
        CacheStorage.read(_userKey, isDecoded: true);
    final token = await SecureStorage.read(_tokenKey);

    log('userMap $userMap, token $token');
    if (token != null && userMap != null) {
      sl<NetworkService>().setToken(token);
      emit(state.copyWith(
        userModel: UserData.fromJson(userMap),
        userStatus: UserStatus.loggedIn,
      ));
      return true;
    }
    return false;
  }

  void _clearUser() {
    sl<NetworkService>().removeToken();
    emit(UserState.initial());
  }

  UserData get user => state.userModel;
  static UserCubit get instance  => sl<UserCubit>();

  bool get isUserLoggedIn => state.userStatus == UserStatus.loggedIn;
  bool get isActivated => state.userStatus == UserStatus.needActivation;
}
