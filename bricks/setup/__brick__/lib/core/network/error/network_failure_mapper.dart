import 'package:dio/dio.dart';
import 'package:{{name}}/core/failure/failure.dart';
import 'package:{{name}}/core/network/error/network_exception.dart';

/// Mapper class that converts network exceptions to domain-level [Failure] types.
/// This ensures that Dio-specific exceptions never leak beyond the data layer.
class NetworkFailureMapper {
  const NetworkFailureMapper._();

  /// Maps a [DioException] to a [Failure].
  static Failure fromDioException(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return Failure.network(
          message: 'Request timed out',
          details: exception.message,
        );

      case DioExceptionType.connectionError:
        return Failure.network(
          message: 'No internet connection',
          details: exception.message,
        );

      case DioExceptionType.badResponse:
        final statusCode = exception.response?.statusCode;
        if (statusCode != null && statusCode >= 500) {
          return Failure.server(
            message: 'Server error occurred',
            statusCode: statusCode,
            details: exception.response?.statusMessage,
          );
        } else if (statusCode != null && statusCode >= 400) {
          return Failure.server(
            message: 'Client error',
            statusCode: statusCode,
            details: exception.response?.statusMessage,
          );
        }
        return Failure.server(
          message: 'Bad response from server',
          statusCode: statusCode,
          details: exception.message,
        );

      case DioExceptionType.cancel:
        return Failure.network(
          message: 'Request was cancelled',
          details: exception.message,
        );

      case DioExceptionType.badCertificate:
        return Failure.network(
          message: 'Certificate verification failed',
          details: exception.message,
        );

      case DioExceptionType.unknown:
        return Failure.unknown(
          message: 'An unexpected error occurred',
          details: exception.message,
        );
    }
  }

  /// Maps a [NetworkException] to a [Failure].
  static Failure fromNetworkException(NetworkException exception) {
    return switch (exception) {
      NoInternetException() => Failure.network(
          message: exception.message,
          details: exception.details,
        ),
      TimeoutException() => Failure.network(
          message: exception.message,
          details: exception.details,
        ),
      ServerException() => Failure.server(
          message: exception.message,
          statusCode: exception.statusCode,
          details: exception.details,
        ),
      ClientException() => Failure.server(
          message: exception.message,
          statusCode: exception.statusCode,
          details: exception.details,
        ),
      ParsingException() => Failure.unknown(
          message: exception.message,
          details: exception.details,
        ),
      CancelledException() => Failure.network(
          message: exception.message,
          details: exception.details,
        ),
      UnknownNetworkException() => Failure.unknown(
          message: exception.message,
          details: exception.details,
        ),
    };
  }

  /// Generic mapper that handles any exception type.
  /// First checks if it's a [DioException], then [NetworkException],
  /// otherwise treats it as an unknown failure.
  static Failure fromException(Object exception) {
    if (exception is DioException) {
      return fromDioException(exception);
    } else if (exception is NetworkException) {
      return fromNetworkException(exception);
    } else {
      return Failure.unknown(
        message: 'An unexpected error occurred',
        details: exception.toString(),
      );
    }
  }
}

