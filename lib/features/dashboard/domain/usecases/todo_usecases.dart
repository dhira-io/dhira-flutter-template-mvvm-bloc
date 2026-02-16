import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/todo_entity.dart';
import '../repositories/todo_repository.dart';

class GetTodosUseCase {
  final TodoRepository repository;
  GetTodosUseCase(this.repository);
  Future<Either<Failure, List<TodoEntity>>> call() => repository.getTodos();
}

class AddTodoUseCase {
  final TodoRepository repository;
  AddTodoUseCase(this.repository);
  Future<Either<Failure, Unit>> call(TodoEntity todo) =>
      repository.addTodo(todo);
}

class UpdateTodoUseCase {
  final TodoRepository repository;
  UpdateTodoUseCase(this.repository);
  Future<Either<Failure, Unit>> call(TodoEntity todo) =>
      repository.updateTodo(todo);
}

class DeleteTodoUseCase {
  final TodoRepository repository;
  DeleteTodoUseCase(this.repository);
  Future<Either<Failure, Unit>> call(String id) => repository.deleteTodo(id);
}

class WatchTodosUseCase {
  final TodoRepository repository;
  WatchTodosUseCase(this.repository);
  Stream<List<TodoEntity>> call() => repository.watchTodos();
}
