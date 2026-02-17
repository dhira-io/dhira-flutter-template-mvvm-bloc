import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../network/dio_client.dart';
import '../network/network_info.dart';
import '../network/session_manager.dart';
import '../storage/token_repository.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/settings/presentation/bloc/settings_cubit.dart';
import '../../features/auth/domain/usecases/login_usecase.dart';
import '../../features/auth/domain/usecases/register_usecase.dart';

import '../constants/flavor_config.dart';

class CoreBinding extends Bindings {
  @override
  void dependencies() {
    // Connectivity
    Get.lazyPut<Connectivity>(() => Connectivity());

    // Network Info
    Get.lazyPut<NetworkInfo>(() => NetworkInfoImpl(Get.find<Connectivity>()));

    // Security & Storage
    Get.lazyPut<FlutterSecureStorage>(() => const FlutterSecureStorage());
    Get.put<SettingsCubit>(SettingsCubit(Get.find()));
    Get.put<AuthBloc>(
      AuthBloc(
        loginUseCase: Get.find(),
        registerUseCase: Get.find(),
        authRepository: Get.find(),
      ),
    );
    Get.put<AuthRepository>(
      AuthRepositoryImpl(
        remoteDataSource: Get.find(),
        secureStorageRepository: Get.find(),
        networkInfo: Get.find(),
      ),
    );

    // UseCases
    Get.lazyPut(() => LoginUseCase(Get.find()));
    Get.lazyPut(() => RegisterUseCase(Get.find()));
    Get.lazyPut<SecureStorageRepository>(
      () => SecureStorageRepositoryImpl(Get.find<FlutterSecureStorage>()),
    );

    // Session Management
    Get.put<SessionManager>(SessionManager(), permanent: true);

    // Dio Client
    Get.lazyPut<DioClient>(
      () => DioClient(
        baseUrl: FlavorConfig.instance.baseUrl,
        sessionManager: Get.find<SessionManager>(),
      ),
    );
  }
}
