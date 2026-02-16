import 'dart:async';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../../core/constants/app_constants.dart';
import '../models/todo_model.dart';

abstract class TodoLocalDataSource {
  Future<List<TodoModel>> getTodos();
  Future<void> saveTodo(TodoModel todo);
  Future<void> deleteTodo(String id);
  Stream<List<TodoModel>> watchTodos();
}

class TodoLocalDataSourceImpl implements TodoLocalDataSource {
  final Box<TodoModel> _todoBox = Hive.box<TodoModel>(AppConstants.todoBoxName);
  final _todoController = StreamController<List<TodoModel>>.broadcast();

  TodoLocalDataSourceImpl() {
    _emitCurrentTodos();
    _todoBox.watch().listen((event) {
      _emitCurrentTodos();
    });
  }

  void _emitCurrentTodos() {
    final todos = _todoBox.values.toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
    _todoController.add(todos);
  }

  @override
  Future<List<TodoModel>> getTodos() async {
    return _todoBox.values.toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }

  @override
  Future<void> saveTodo(TodoModel todo) async {
    await _todoBox.put(todo.id, todo);
  }

  @override
  Future<void> deleteTodo(String id) async {
    await _todoBox.delete(id);
  }

  @override
  Stream<List<TodoModel>> watchTodos() {
    return _todoController.stream;
  }
}
