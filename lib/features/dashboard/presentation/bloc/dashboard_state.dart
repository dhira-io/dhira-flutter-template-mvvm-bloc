import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/todo_entity.dart';

part 'dashboard_state.freezed.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState.initial() = DashboardInitial;
  const factory DashboardState.loading() = DashboardLoading;
  const factory DashboardState.loaded(List<TodoEntity> todos) = DashboardLoaded;
  const factory DashboardState.error(String message) = DashboardError;
}
