import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String id,
    required String email,
    String? username,
    String? name,
    String? image,
    String? token,
    String? refreshToken,
  }) = _UserEntity;
}
