import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../network/dio_client.dart';
import '../network/network_info.dart';
import '../network/session_manager.dart';
import '../storage/token_repository.dart';
import '../storage/settings_repository.dart';
import '../../features/settings/presentation/bloc/settings_cubit.dart';

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
    Get.lazyPut<SecureStorageRepository>(
      () => SecureStorageRepositoryImpl(Get.find<FlutterSecureStorage>()),
    );
    Get.lazyPut<SettingsRepository>(() => SettingsRepository());

    // Session Management
    Get.put<SessionManager>(SessionManager(), permanent: true);

    // Settings
    Get.lazyPut<SettingsCubit>(
      () => SettingsCubit(Get.find<SettingsRepository>()),
    );

    // Dio Client
    Get.lazyPut<DioClient>(
      () => DioClient(
        baseUrl: FlavorConfig.instance.baseUrl,
        sessionManager: Get.find<SessionManager>(),
      ),
    );
  }
}
