import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/todo_entity.dart';

abstract class TodoRepository {
  Future<Either<Failure, List<TodoEntity>>> getTodos();
  Future<Either<Failure, Unit>> addTodo(TodoEntity todo);
  Future<Either<Failure, Unit>> updateTodo(TodoEntity todo);
  Future<Either<Failure, Unit>> deleteTodo(String id);
  Stream<List<TodoEntity>> watchTodos();
}
