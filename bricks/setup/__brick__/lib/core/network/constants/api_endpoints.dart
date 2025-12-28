/// API endpoint constants.
/// These are placeholders for mock data - update when backend is ready.
class ApiEndpoints {
  const ApiEndpoints._();

  /// Base URL for the API
  /// TODO: Update with actual backend URL when ready
  static const String baseUrl = 'https://api.example.com';

  /// API version prefix
  static const String apiVersion = '/api/v1';

  /// Timeout durations
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const Duration sendTimeout = Duration(seconds: 30);

  // Example endpoints (placeholders for future features)
  // static const String login = '$apiVersion/auth/login';
  // static const String register = '$apiVersion/auth/register';
  // static const String profile = '$apiVersion/user/profile';
}

