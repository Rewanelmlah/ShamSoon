import 'dart:io';
import 'package:dio/dio.dart';
import '../helpers/language.dart';

class ConfigurationInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({
      'Accept': ContentType.json,
      HttpHeaders.acceptLanguageHeader:
          Languages.currentLanguage.locale.languageCode,
      HttpHeaders.authorizationHeader : 'bearer hLCqZzPc4Uv00WEM5EHLjdrcwWil4p1J1d1jYkQD27d40c0c'
    });
    handler.next(options);
  }

  // @override
  // void onResponse(Response response, ResponseInterceptorHandler handler) {
  //   if(response.statusCode == 401){
  //     handler.reject(DioException(requestOptions: RequestOptions()));
  //   }
  //   super.onResponse(response, handler);
  // }
  // @override
  // void onResponse(Response response, ResponseInterceptorHandler handler) async{
  //   if (response.statusCode == 302) {
  //     final newUrl = response.headers.value('location');
  //     if (newUrl != null) {
  //       final redirectedResponse = await Dio().get(newUrl);
  //       handler.resolve(redirectedResponse);
  //     }
  //   }
  //
  //   handler.next(response);
  // }

  // @override
  // void onResponse(Response response, ResponseInterceptorHandler handler) {
  //   if (BackendConfiguation.type.isPhp) {
  //     _handleError(response);
  //   }
  //   handler.next(response);
  // }

  // void _handleError(Response response) {
  //   final errorKey = response.data['key'];
  //   final statusCode = _mapErrorKeyToStatusCode(errorKey); // need activate = 403
  //
  //   final errorMessage = response.data['msg'];
  //
  //   if (statusCode != null) {
  //     throw DioException(
  //       type: DioExceptionType.badResponse,
  //       requestOptions: response.requestOptions,
  //       response: Response(
  //         requestOptions: response.requestOptions,
  //         data: {
  //           'message': errorMessage,
  //         },
  //         statusCode: statusCode,
  //       ),
  //       error: {
  //         'message': errorMessage,
  //       },
  //     );
  //   }
  // }

  // bool isNeedApproval(String key) {
  //   if (key == 'needApproval') {
  //     UserCubit.instance.setUserStatus(UserStatus.needApproval);
  //   }
  //   UserCubit.instance.setUserStatus(UserStatus.needApproval);
  //   return false;
  // }

  // int? _mapErrorKeyToStatusCode(String errorKey) {
  //   switch (errorKey) {
  //     case 'fail':
  //       return HttpStatus.badRequest;
  //     case 'unauthenticated':
  //       return HttpStatus.unauthorized;
  //     case 'blocked':
  //       return HttpStatus.locked;
  //     case 'exception':
  //       return HttpStatus.internalServerError;
  //     case 'needActive':
  //       return HttpStatus.forbidden;
  //     default:
  //       return null;
  //   }
  // }
}