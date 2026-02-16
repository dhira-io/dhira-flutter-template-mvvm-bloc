import 'package:get/get.dart';
import '../data/datasources/todo_local_data_source.dart';
import '../data/repositories/todo_repository_impl.dart';
import '../domain/repositories/todo_repository.dart';
import '../domain/usecases/todo_usecases.dart';
import 'bloc/dashboard_bloc.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    // Data Source
    Get.lazyPut<TodoLocalDataSource>(() => TodoLocalDataSourceImpl());

    // Repository
    Get.lazyPut<TodoRepository>(
      () =>
          TodoRepositoryImpl(localDataSource: Get.find<TodoLocalDataSource>()),
    );

    // Use Cases
    Get.lazyPut(() => GetTodosUseCase(Get.find<TodoRepository>()));
    Get.lazyPut(() => AddTodoUseCase(Get.find<TodoRepository>()));
    Get.lazyPut(() => UpdateTodoUseCase(Get.find<TodoRepository>()));
    Get.lazyPut(() => DeleteTodoUseCase(Get.find<TodoRepository>()));
    Get.lazyPut(() => WatchTodosUseCase(Get.find<TodoRepository>()));

    // BLoC
    Get.lazyPut(
      () => DashboardBloc(
        getTodosUseCase: Get.find<GetTodosUseCase>(),
        addTodoUseCase: Get.find<AddTodoUseCase>(),
        updateTodoUseCase: Get.find<UpdateTodoUseCase>(),
        deleteTodoUseCase: Get.find<DeleteTodoUseCase>(),
        watchTodosUseCase: Get.find<WatchTodosUseCase>(),
      ),
    );
  }
}
