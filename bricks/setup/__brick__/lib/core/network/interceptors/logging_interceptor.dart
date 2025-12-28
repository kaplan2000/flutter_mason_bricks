import 'dart:developer' as developer;
import 'package:dio/dio.dart';

/// Interceptor for logging HTTP requests, responses, and errors.
/// Useful for debugging network calls during development.
class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    developer.log(
      'REQUEST[${options.method}] => ${options.uri}',
      name: 'DioClient',
    );
    
    if (options.data != null) {
      developer.log(
        'REQUEST BODY: ${options.data}',
        name: 'DioClient',
      );
    }
    
    if (options.headers.isNotEmpty) {
      developer.log(
        'REQUEST HEADERS: ${options.headers}',
        name: 'DioClient',
      );
    }
    
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    developer.log(
      'RESPONSE[${response.statusCode}] => ${response.requestOptions.uri}',
      name: 'DioClient',
    );
    
    if (response.data != null) {
      developer.log(
        'RESPONSE BODY: ${response.data}',
        name: 'DioClient',
      );
    }
    
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    developer.log(
      'ERROR[${err.response?.statusCode}] => ${err.requestOptions.uri}',
      name: 'DioClient',
      error: err,
    );
    
    if (err.response?.data != null) {
      developer.log(
        'ERROR RESPONSE: ${err.response?.data}',
        name: 'DioClient',
      );
    }
    
    developer.log(
      'ERROR MESSAGE: ${err.message}',
      name: 'DioClient',
    );
    
    super.onError(err, handler);
  }
}

