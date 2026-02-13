import 'package:dhira_flutter_template/core/constants/flavor_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'core/di/core_binding.dart';
import 'core/routing/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/storage/hive_service.dart';
import 'features/auth/presentation/auth_binding.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/presentation/bloc/auth_event.dart';

void main() async {
  await bootstrap();
}

Future<void> bootstrap([AppConfig? config]) async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Flavor
  if (config != null) {
    FlavorConfig.initialize(config);
  } else {
    // Detect from --dart-define
    FlavorConfig.instance;
  }

  // Initialize Hive
  await HiveService.init();

  // Initialize Global Bindings
  CoreBinding().dependencies();
  AuthBinding().dependencies();

  runApp(const DhiraApp());
}

class DhiraApp extends StatelessWidget {
  const DhiraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => Get.find<AuthBloc>()..add(AuthCheckRequested()),
        ),
      ],
      child: MaterialApp.router(
        title: 'Dhira Flutter Template',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        routerConfig: AppRouter.router,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('en', '')],
      ),
    );
  }
}
