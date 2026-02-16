import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/todo_entity.dart';

part 'dashboard_event.freezed.dart';

@freezed
class DashboardEvent with _$DashboardEvent {
  const factory DashboardEvent.started() = DashboardStarted;
  const factory DashboardEvent.addTodo(TodoEntity todo) = AddTodoEvent;
  const factory DashboardEvent.updateTodo(TodoEntity todo) = UpdateTodoEvent;
  const factory DashboardEvent.deleteTodo(String id) = DeleteTodoEvent;
  const factory DashboardEvent.todosUpdated(List<TodoEntity> todos) =
      TodosUpdated;
}
