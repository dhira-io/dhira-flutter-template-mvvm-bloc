import 'package:get/get.dart';
import 'package:todo_app/core/network/dio_client.dart';
import 'package:todo_app/core/network/network_info.dart';
import 'package:todo_app/core/storage/token_repository.dart';
import 'package:todo_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:todo_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:todo_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:todo_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:todo_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:todo_app/features/auth/presentation/bloc/auth_bloc.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    // Data Source
    Get.lazyPut<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(Get.find<DioClient>()),
    );

    // Repository
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(
        remoteDataSource: Get.find<AuthRemoteDataSource>(),
        secureStorageRepository: Get.find<SecureStorageRepository>(),
        networkInfo: Get.find<NetworkInfo>(),
      ),
    );

    // Use Cases
    Get.lazyPut(() => LoginUseCase(Get.find<AuthRepository>()));
    Get.lazyPut(() => RegisterUseCase(Get.find<AuthRepository>()));

    // BLoC
    Get.lazyPut(
      () => AuthBloc(
        loginUseCase: Get.find<LoginUseCase>(),
        registerUseCase: Get.find<RegisterUseCase>(),
        authRepository: Get.find<AuthRepository>(),
      ),
    );
  }
}
