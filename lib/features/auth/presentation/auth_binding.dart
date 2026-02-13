import 'package:get/get.dart';
import 'package:dhira_flutter_template/core/network/dio_client.dart';
import 'package:dhira_flutter_template/core/network/network_info.dart';
import 'package:dhira_flutter_template/core/storage/token_repository.dart';
import 'package:dhira_flutter_template/features/auth/data/auth_remote_data_source.dart';
import 'package:dhira_flutter_template/features/auth/data/auth_repository_impl.dart';
import 'package:dhira_flutter_template/features/auth/domain/auth_repository.dart';
import 'package:dhira_flutter_template/features/auth/domain/login_usecase.dart';
import 'package:dhira_flutter_template/features/auth/domain/register_usecase.dart';
import 'package:dhira_flutter_template/features/auth/presentation/bloc/auth_bloc.dart';

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
        tokenRepository: Get.find<TokenRepository>(),
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
