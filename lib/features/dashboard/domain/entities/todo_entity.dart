import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_entity.freezed.dart';

@freezed
class TodoEntity with _$TodoEntity {
  const factory TodoEntity({
    required String id,
    required String title,
    required String description,
    required DateTime createdAt,
    @Default(false) bool isCompleted,
  }) = _TodoEntity;
}
