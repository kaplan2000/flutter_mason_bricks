import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

/// Base failure class representing domain-level errors.
/// Used with fpdart's Either type for functional error handling.
@freezed
sealed class Failure with _$Failure {
  const Failure._();

  /// Network-related failures (connectivity, timeout, etc.)
  const factory Failure.network({required String message, String? details}) =
      NetworkFailure;

  /// Server-related failures (HTTP errors, API errors)
  const factory Failure.server({
    required String message,
    int? statusCode,
    String? details,
  }) = ServerFailure;

  /// Cache-related failures (local storage errors)
  const factory Failure.cache({required String message, String? details}) =
      CacheFailure;

  /// Unknown or unexpected failures
  const factory Failure.unknown({required String message, String? details}) =
      UnknownFailure;

  /// Helper method to get the error message from any failure type.
  String get errorMessage => when(
    network: (message, _) => message,
    server: (message, _, __) => message,
    cache: (message, _) => message,
    unknown: (message, _) => message,
  );

  /// Helper method to get optional details from any failure type.
  String? get errorDetails => when(
    network: (_, details) => details,
    server: (_, __, details) => details,
    cache: (_, details) => details,
    unknown: (_, details) => details,
  );
}

