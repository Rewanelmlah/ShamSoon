import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shamsoon/core/network/extensions.dart';
import 'package:shamsoon/core/shared/base_model.dart';
import '../../src/config/language/locale_keys.g.dart';
import '../error/exceptions.dart';
import '../helpers/constant_manager.dart';
import 'log_interceptor.dart';
import 'network_request.dart';
import 'network_service.dart';

class AiService implements NetworkService {
  late final Dio _dio;

  AiService() {
    _initDio();
  }

  void _initDio() {
    _dio = Dio()
      ..options.baseUrl = ConstantManager.aiUrl
      ..options.connectTimeout = const Duration(
        seconds: ConstantManager.connectTimeoutDuration,
      )
      ..options.receiveTimeout = const Duration(
        seconds: ConstantManager.recieveTimeoutDuration,
      )
      ..options.responseType = ResponseType.json;

    if (kDebugMode) {
      _dio.interceptors.add(LoggerInterceptor());
    }
  }

  @override
  void setToken(String token) {
    _dio.options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
  }

  @override
  void removeToken() {
    _dio.options.headers.remove(HttpHeaders.authorizationHeader);
  }

  @override
  Future<BaseModel<Model>> callApi<Model>(NetworkRequest networkRequest,
      {Model Function(dynamic json)? mapper}) async {
    try {
      log('path${networkRequest.path}');

      await networkRequest.prepareRequestData();
      final response = await _dio.request(networkRequest.path,
          data: networkRequest.hasBodyAndProgress()
              ? networkRequest.isFormData
              ? FormData.fromMap(networkRequest.body!)
              : networkRequest.body
              : networkRequest.body,
          queryParameters: networkRequest.queryParameters,
          onSendProgress: networkRequest.hasBodyAndProgress()
              ? networkRequest.onSendProgress
              : null,
          onReceiveProgress: networkRequest.hasBodyAndProgress()
              ? networkRequest.onReceiveProgress
              : null,
          options: Options(
              method: networkRequest.asString(),
              headers: networkRequest.headers));
      log('response ${response.data.toString()}');
      if (mapper != null) {
        return BaseModel.fromJson(response.data, jsonToModel: mapper);
      } else {
        return BaseModel.fromJson(response.data);
      }
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  dynamic _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw NoInternetConnectionException(LocaleKeys.checkInternet);
      case DioExceptionType.badResponse:
        switch (error.response!.statusCode) {
          // case HttpStatus.forbidden:
          //   throw ForbiddenException(
          //     error.response?.data['message'] ?? LocaleKeys.forbidden,
          //   );

          case HttpStatus.badRequest:
            throw BadRequestException(
              error.response?.data['error'] ?? LocaleKeys.badRequest,
            );
          // case HttpStatus.unauthorized:
          //   throw UnauthorizedException(
          //     error.response?.data['message'] ?? LocaleKeys.unauthorized,
          //   );
          // case HttpStatus.locked:
          //   throw BlockedException(
          //     error.response?.data['message'] ?? LocaleKeys.unauthorized,
          //   );
          case HttpStatus.notFound:
            throw NotFoundException(LocaleKeys.notFound);
          case HttpStatus.conflict:
            throw ConflictException(
              error.response?.data['error'] ?? LocaleKeys.serverError,
            );
          case HttpStatus.internalServerError:
            throw InternalServerErrorException(
              error.response?.data['message'] ?? LocaleKeys.serverError,
            );
          default:
            throw ServerException(LocaleKeys.serverError);
        }
      case DioExceptionType.cancel:
        throw ServerException(LocaleKeys.intenetWeakness);
      case DioExceptionType.unknown:
        throw ServerException(
          error.response?.data['error'] ?? LocaleKeys.exceptionError,
        );
      default:
        throw ServerException(
          error.response?.data['error'] ?? LocaleKeys.exceptionError,
        );
    }
  }
}