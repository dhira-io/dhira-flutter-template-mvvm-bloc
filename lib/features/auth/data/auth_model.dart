import 'package:freezed_annotation/freezed_annotation.dart';
import '../domain/user_entity.dart';

part 'auth_model.freezed.dart';
part 'auth_model.g.dart';

@freezed
class AuthModel with _$AuthModel {
  const factory AuthModel({
    required String id,
    required String email,
    String? name,
    String? token,
  }) = _AuthModel;

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);

  const AuthModel._();

  UserEntity toEntity() {
    return UserEntity(id: id, email: email, name: name, token: token);
  }
}
