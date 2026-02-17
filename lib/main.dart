import 'package:todo_app/core/constants/flavor_config.dart';
import 'package:todo_app/l10n/app_localizations.dart';
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
import 'features/settings/presentation/bloc/settings_cubit.dart';
import 'features/settings/presentation/bloc/settings_state.dart';
import 'core/network/session_watcher.dart';

void main() async {
  await bootstrap();
}

Future<void> bootstrap([AppConfig? config]) async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Flavor
  if (config != null) {
    FlavorConfig.instance = config;
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
        BlocProvider<AuthBloc>(create: (context) => Get.find<AuthBloc>()),
        BlocProvider<SettingsCubit>(
          create: (context) => Get.find<SettingsCubit>(),
        ),
      ],
      child: SessionWatcher(
        child: BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
            return MaterialApp.router(
              title: 'Todo App(Android & IOS)',
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: state.themeMode,
              locale: state.locale,
              routerConfig: AppRouter.router,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: AppLocalizations.supportedLocales,
            );
          },
        ),
      ),
    );
  }
}
