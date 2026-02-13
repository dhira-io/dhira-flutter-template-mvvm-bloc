import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_requests_responses.freezed.dart';
part 'auth_requests_responses.g.dart';

@freezed
class AuthRequest with _$AuthRequest {
  const factory AuthRequest({required String email, required String password}) =
      _AuthRequest;

  factory AuthRequest.fromJson(Map<String, dynamic> json) =>
      _$AuthRequestFromJson(json);
}

@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({required String token}) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@freezed
class RegisterResponse with _$RegisterResponse {
  const factory RegisterResponse({required int id, required String token}) =
      _RegisterResponse;

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);
}
