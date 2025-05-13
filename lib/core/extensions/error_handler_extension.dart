import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:multiple_result/multiple_result.dart';
import '../../features/Authentication/presentation/screens/login.dart';
import '../error/exceptions.dart';
import '../error/failure.dart';
import '../helpers/navigation.dart';

extension ErrorHandler<T extends dynamic> on Future<T> {
  Future<Result<T, Failure>> handleCallbackWithFailure() async {
    if (kDebugMode) {
      return await _defaultHandler();
    } else {
      try {
        return await _defaultHandler();
      } catch (e) {
        return const Error(Failure('An error occurred'));
      }
    }
  }

  Future<Result<T, Failure>> _defaultHandler() async {
    try {
      final result = await this;
      return Success(result);
    } on BlockedException catch (e) {
      return Error(Failure(e.message));
    }on UnauthorizedException catch(e){
      log('unAuth');
      Go.offAll(LogIn());
      return Result.error(Failure(e.message));
    }on ServerException catch (e) {
      return Result.error(Failure(e.message));
    }
  }
}
