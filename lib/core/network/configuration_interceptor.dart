import 'dart:io';
import 'package:dio/dio.dart';
import 'package:html/parser.dart' show parse;
import '../helpers/language.dart';

class ConfigurationInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({
      'Accept': ContentType.json,
      // Headers.contentTypeHeader: Headers,
      HttpHeaders.acceptLanguageHeader:
          Languages.currentLanguage.locale.languageCode
    });
    handler.next(options);
  }

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

  void _handleError(Response response) {
    final errorKey = response.data['key'];
    final statusCode = _mapErrorKeyToStatusCode(errorKey); // need activate = 403

    final errorMessage = response.data['msg'];

    if (statusCode != null) {
      throw DioException(
        type: DioExceptionType.badResponse,
        requestOptions: response.requestOptions,
        response: Response(
          requestOptions: response.requestOptions,
          data: {
            'message': errorMessage,
          },
          statusCode: statusCode,
        ),
        error: {
          'message': errorMessage,
        },
      );
    }
  }

  // bool isNeedApproval(String key) {
  //   if (key == 'needApproval') {
  //     UserCubit.instance.setUserStatus(UserStatus.needApproval);
  //   }
  //   UserCubit.instance.setUserStatus(UserStatus.needApproval);
  //   return false;
  // }

  int? _mapErrorKeyToStatusCode(String errorKey) {
    switch (errorKey) {
      case 'fail':
        return HttpStatus.badRequest;
      case 'unauthenticated':
        return HttpStatus.unauthorized;
      case 'blocked':
        return HttpStatus.locked;
      case 'exception':
        return HttpStatus.internalServerError;
      case 'needActive':
        return HttpStatus.forbidden;
      default:
        return null;
    }
  }
}


// class RedirectInterceptor extends Interceptor {
//   final int maxRedirects = 5;

  // @override
  // void onResponse(Response response, ResponseInterceptorHandler handler) async {
  //   if (response.statusCode == 302 || response.statusCode == 301) {
  //     final newUrl = response.headers.value('location');
  //     if (newUrl != null) {
  //       final redirectedResponse = await _followRedirect(newUrl, response.requestOptions, 0);
  //       handler.resolve(redirectedResponse);
  //       return;
  //     }
  //   }
  //   handler.next(response);
  // }

  // Future<Response> _followRedirect(String url, RequestOptions options, int redirectCount) async {
  //   if (redirectCount >= maxRedirects) {
  //     throw DioError(
  //       requestOptions: options,
  //       error: 'Too many redirects',
  //       type: DioErrorType.other,
  //     );
  //   }
  //
  //   final dio = Dio();
  //   dio.options.headers['ngrok-skip-browser-warning'] = 'true'; // For ngrok
  //
  //   try {
  //     final response = await dio.get(url, options: Options(
  //       followRedirects: false,
  //       validateStatus: (status) => status != null && status < 400,
  //     ));
  //
  //     if (response.statusCode == 302 || response.statusCode == 301) {
  //       final newUrl = response.headers.value('location');
  //       if (newUrl != null) {
  //         return _followRedirect(newUrl, options, redirectCount + 1);
  //       }
  //     } else if (response.data is String && response.data.contains('meta http-equiv="refresh"')) {
  //       final document = parse(response.data);
  //       final meta = document.querySelector('meta[http-equiv="refresh"]');
  //       final content = meta?.attributes['content'];
  //       if (content != null) {
  //         final urlMatch = RegExp(r'url=[\'"]?([^\'">]+)[\'"]?').firstMatch(content);
  //
  //         // final urlMatch = RegExp(r'url=[\'"]?([^\'" >]+)').firstMatch(content);
  //         if (urlMatch != null) {
  //           final newUrl = urlMatch.group(1)!;
  //           return _followRedirect(newUrl, options, redirectCount + 1);
  //         }
  //       }
  //     }
  //     return response;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
// }