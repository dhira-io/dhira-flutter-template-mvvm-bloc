import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/todo_usecases.dart';
import 'dashboard_event.dart';
import 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final GetTodosUseCase getTodosUseCase;
  final AddTodoUseCase addTodoUseCase;
  final UpdateTodoUseCase updateTodoUseCase;
  final DeleteTodoUseCase deleteTodoUseCase;
  final WatchTodosUseCase watchTodosUseCase;

  StreamSubscription? _todosSubscription;

  DashboardBloc({
    required this.getTodosUseCase,
    required this.addTodoUseCase,
    required this.updateTodoUseCase,
    required this.deleteTodoUseCase,
    required this.watchTodosUseCase,
  }) : super(const DashboardState.initial()) {
    on<DashboardStarted>(_onStarted);
    on<AddTodoEvent>(_onAddTodo);
    on<UpdateTodoEvent>(_onUpdateTodo);
    on<DeleteTodoEvent>(_onDeleteTodo);
    on<TodosUpdated>(_onTodosUpdated);
  }

  Future<void> _onStarted(
    DashboardStarted event,
    Emitter<DashboardState> emit,
  ) async {
    emit(const DashboardState.loading());

    // Initial fetch
    final result = await getTodosUseCase();
    result.fold(
      (failure) => emit(DashboardState.error(failure.message)),
      (todos) => emit(DashboardState.loaded(todos)),
    );

    // Watch for changes
    await _todosSubscription?.cancel();
    _todosSubscription = watchTodosUseCase().listen((todos) {
      add(DashboardEvent.todosUpdated(todos));
    });
  }

  Future<void> _onAddTodo(
    AddTodoEvent event,
    Emitter<DashboardState> emit,
  ) async {
    final result = await addTodoUseCase(event.todo);
    result.leftMap(
      (failure) => add(
        DashboardEvent.todosUpdated(
          state.maybeWhen(loaded: (todos) => todos, orElse: () => []),
        ),
      ),
    ); // Potentially emit error but keeping it simple for reactive flow
  }

  Future<void> _onUpdateTodo(
    UpdateTodoEvent event,
    Emitter<DashboardState> emit,
  ) async {
    await updateTodoUseCase(event.todo);
  }

  Future<void> _onDeleteTodo(
    DeleteTodoEvent event,
    Emitter<DashboardState> emit,
  ) async {
    await deleteTodoUseCase(event.id);
  }

  void _onTodosUpdated(TodosUpdated event, Emitter<DashboardState> emit) {
    emit(DashboardState.loaded(event.todos));
  }

  @override
  Future<void> close() {
    _todosSubscription?.cancel();
    return super.close();
  }
}
