import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.server({
    @Default('Internal Server Error') String message,
    int? code,
  }) = ServerFailure;

  const factory Failure.cache({
    @Default('Cache Error') String message,
  }) = CacheFailure;

  const factory Failure.network({
    @Default('No Internet Connection') String message,
  }) = NetworkFailure;

  const factory Failure.validation({
    required String message,
  }) = ValidationFailure;

  const factory Failure.unauthorized({
    @Default('Unauthorized Access') String message,
  }) = UnauthorizedFailure;

  const factory Failure.unknown({
    @Default('An unknown error occurred') String message,
  }) = UnknownFailure;
}
