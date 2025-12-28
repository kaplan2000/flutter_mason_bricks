import 'package:dio/dio.dart';
import 'package:{{name}}/core/network/constants/api_endpoints.dart';
import 'package:{{name}}/core/network/interceptors/auth_interceptor.dart';
import 'package:{{name}}/core/network/interceptors/logging_interceptor.dart';

/// Configured Dio client for making HTTP requests.
/// Includes interceptors for authentication and logging.
class DioClient {
  DioClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        connectTimeout: ApiEndpoints.connectTimeout,
        receiveTimeout: ApiEndpoints.receiveTimeout,
        sendTimeout: ApiEndpoints.sendTimeout,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    // Add interceptors
    _dio.interceptors.addAll([
      LoggingInterceptor(),
      AuthInterceptor(),
    ]);
  }

  late final Dio _dio;

  /// Returns the configured Dio instance.
  /// Use this for making network requests in data sources.
  Dio get dio => _dio;
}

