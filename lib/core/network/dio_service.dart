import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shamsoon/core/network/extensions.dart';
import 'package:shamsoon/core/shared/base_model.dart';
import '../../src/config/language/locale_keys.g.dart';
import '../error/exceptions.dart';
import '../helpers/constant_manager.dart';
import 'configuration_interceptor.dart';
import 'log_interceptor.dart';
import 'network_request.dart';
import 'network_service.dart';

class DioService implements NetworkService {
  late final Dio _dio;

  DioService() {
    _initDio();
  }

  void _initDio() {
    _dio = Dio()
      ..options.baseUrl = ConstantManager.baseUrl
      ..options.connectTimeout = const Duration(
        seconds: ConstantManager.connectTimeoutDuration,
      )
      ..options.receiveTimeout = const Duration(
        seconds: ConstantManager.recieveTimeoutDuration,
      )
      ..options.responseType = ResponseType.json;
      _dio.interceptors.add(ConfigurationInterceptor());

    // if (BackendConfiguation.type.isPhp) {
    //   _dio.interceptors.add(ConfigurationInterceptor());
    // }
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
              followRedirects: true,
              method: networkRequest.asString(),
              headers: networkRequest.headers));
      log('response ${response.data.toString()}');
      if (mapper != null) {
        return BaseModel.fromJson(response.data, jsonToModel: mapper);
      } else {
        return BaseModel.fromJson(response.data);
      }
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  ServerException _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return NoInternetConnectionException(LocaleKeys.checkInternet);
      case DioExceptionType.badResponse:
        switch (error.response!.statusCode) {
          case HttpStatus.unprocessableEntity:
            return UnprocessableEntityException(
              error.response?.data['message'] ?? 'unprocessableEntity',
            );
          case HttpStatus.forbidden:
            return ForbiddenException(
              error.response?.data['message'] ?? LocaleKeys.forbidden,
            );

          case HttpStatus.badRequest:
            return BadRequestException(
              error.response?.data['message'] ?? LocaleKeys.badRequest,
            );
          case HttpStatus.unauthorized:
            return UnauthorizedException(
              error.response?.data['message'] ?? LocaleKeys.unauthorized,
            );
          case HttpStatus.locked:
            return BlockedException(
              error.response?.data['message'] ?? LocaleKeys.unauthorized,
            );
          case HttpStatus.notFound:
            return NotFoundException(LocaleKeys.notFound);
          case HttpStatus.conflict:
            return ConflictException(
              error.response?.data['message'] ?? LocaleKeys.serverError,
            );
          case HttpStatus.internalServerError:
            return InternalServerErrorException(
              error.response?.data['message'] ?? LocaleKeys.serverError,
            );
          default:
            return ServerException(LocaleKeys.serverError);
        }
      case DioExceptionType.cancel:
        return ServerException(LocaleKeys.intenetWeakness);
      case DioExceptionType.unknown:
        return ServerException(
          error.response?.data['message'] ?? LocaleKeys.exceptionError,
        );
      default:
        return ServerException(
          error.response?.data['message'] ?? LocaleKeys.exceptionError,
        );
    }
  }
}