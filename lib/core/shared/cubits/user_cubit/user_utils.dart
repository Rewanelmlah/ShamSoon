part of 'user_cubit.dart';

mixin UserUtils {
  Future<void> _saveUser(UserModel user) async {
    logDebug('user saved: ${user.toJsonCaching()}');

    await CacheStorage.write(
      _userKey,
      jsonEncode(user.toJsonCaching()),
    );
  }

  Future<void> _saveToken(String token) async {
    await SecureStorage.write(_tokenKey, token);
  }
}
