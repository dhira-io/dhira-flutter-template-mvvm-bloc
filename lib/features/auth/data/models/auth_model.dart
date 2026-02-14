import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user_entity.dart';

part 'auth_model.freezed.dart';
part 'auth_model.g.dart';

@freezed
class AuthModel with _$AuthModel {
  const factory AuthModel({
    required int id,
    required String email,
    String? username,
    String? firstName,
    String? lastName,
    String? gender,
    String? image,
    @JsonKey(name: 'accessToken') String? token,
    String? refreshToken,
  }) = _AuthModel;

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);

  const AuthModel._();

  UserEntity toEntity() {
    return UserEntity(
      id: id.toString(),
      email: email,
      username: username,
      name: (firstName != null || lastName != null)
          ? '${firstName ?? ''} ${lastName ?? ''}'.trim()
          : null,
      image: image,
      token: token,
      refreshToken: refreshToken,
    );
  }
}
