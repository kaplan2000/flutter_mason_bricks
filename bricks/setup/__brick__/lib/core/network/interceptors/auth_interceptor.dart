import 'package:dio/dio.dart';

/// Interceptor for adding authentication headers to requests.
/// Currently a stub that will be implemented when auth is ready.
class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: Add authentication token to headers when auth is implemented
    // Example:
    // final token = await getAuthToken();
    // if (token != null) {
    //   options.headers['Authorization'] = 'Bearer $token';
    // }
    
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TODO: Handle 401 unauthorized errors and refresh token logic
    // Example:
    // if (err.response?.statusCode == 401) {
    //   // Refresh token and retry request
    // }
    
    super.onError(err, handler);
  }
}

