import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.server({
    required String message,
    int? statusCode,
  }) = ServerFailure;

  const factory Failure.network({
    required String message,
  }) = NetworkFailure;

  const factory Failure.authentication({
    required String message,
  }) = AuthenticationFailure;

  const factory Failure.authorization({
    required String message,
  }) = AuthorizationFailure;

  const factory Failure.validation({
    required String message,
    Map<String, List<String>>? errors,
  }) = ValidationFailure;

  const factory Failure.notFound({
    required String message,
  }) = NotFoundFailure;

  const factory Failure.conflict({
    required String message,
  }) = ConflictFailure;

  const factory Failure.unknown({
    required String message,
  }) = UnknownFailure;

  const factory Failure.cache({
    required String message,
  }) = CacheFailure;

  const factory Failure.timeout({
    required String message,
  }) = TimeoutFailure;
}

extension FailureExtension on Failure {
  String get displayMessage {
    return when(
      server: (message, statusCode) => message,
      network: (message) => message,
      authentication: (message) => message,
      authorization: (message) => message,
      validation: (message, errors) => message,
      notFound: (message) => message,
      conflict: (message) => message,
      unknown: (message) => message,
      cache: (message) => message,
      timeout: (message) => message,
    );
  }

  bool get isAuthenticationError {
    return when(
      server: (_, __) => false,
      network: (_) => false,
      authentication: (_) => true,
      authorization: (_) => true,
      validation: (_, __) => false,
      notFound: (_) => false,
      conflict: (_) => false,
      unknown: (_) => false,
      cache: (_) => false,
      timeout: (_) => false,
    );
  }
} 