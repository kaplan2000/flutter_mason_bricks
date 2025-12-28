/// Base class for network-related exceptions.
/// These exceptions are thrown within the data layer and mapped to [Failure] types.
sealed class NetworkException implements Exception {
  const NetworkException(this.message, [this.details]);

  final String message;
  final String? details;

  @override
  String toString() => details != null ? '$message: $details' : message;
}

/// Exception thrown when there is no internet connection.
class NoInternetException extends NetworkException {
  const NoInternetException([String? details])
      : super('No internet connection', details);
}

/// Exception thrown when a request times out.
class TimeoutException extends NetworkException {
  const TimeoutException([String? details])
      : super('Request timed out', details);
}

/// Exception thrown when a server error occurs (5xx status codes).
class ServerException extends NetworkException {
  const ServerException(this.statusCode, [String? details])
      : super('Server error', details);

  final int? statusCode;

  @override
  String toString() => statusCode != null
      ? 'Server error ($statusCode)${details != null ? ': $details' : ''}'
      : super.toString();
}

/// Exception thrown when a client error occurs (4xx status codes).
class ClientException extends NetworkException {
  const ClientException(this.statusCode, [String? details])
      : super('Client error', details);

  final int? statusCode;

  @override
  String toString() => statusCode != null
      ? 'Client error ($statusCode)${details != null ? ': $details' : ''}'
      : super.toString();
}

/// Exception thrown when response parsing fails.
class ParsingException extends NetworkException {
  const ParsingException([String? details])
      : super('Failed to parse response', details);
}

/// Exception thrown when the request is cancelled.
class CancelledException extends NetworkException {
  const CancelledException([String? details])
      : super('Request was cancelled', details);
}

/// Exception thrown for unexpected or unknown network errors.
class UnknownNetworkException extends NetworkException {
  const UnknownNetworkException([String? details])
      : super('An unexpected error occurred', details);
}

