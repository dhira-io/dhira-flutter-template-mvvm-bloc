import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/todo_entity.dart';
import '../../domain/repositories/todo_repository.dart';
import '../datasources/todo_local_data_source.dart';
import '../models/todo_model.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoLocalDataSource localDataSource;

  TodoRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, List<TodoEntity>>> getTodos() async {
    try {
      final models = await localDataSource.getTodos();
      return Right(models.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> addTodo(TodoEntity todo) async {
    try {
      await localDataSource.saveTodo(TodoModel.fromEntity(todo));
      return const Right(unit);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateTodo(TodoEntity todo) async {
    try {
      await localDataSource.saveTodo(TodoModel.fromEntity(todo));
      return const Right(unit);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteTodo(String id) async {
    try {
      await localDataSource.deleteTodo(id);
      return const Right(unit);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Stream<List<TodoEntity>> watchTodos() {
    return localDataSource.watchTodos().map(
      (models) => models.map((m) => m.toEntity()).toList(),
    );
  }
}
