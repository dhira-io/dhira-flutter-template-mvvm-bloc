import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:todo_app/features/auth/presentation/screens/login_screen.dart';
import 'package:todo_app/features/auth/presentation/screens/register_screen.dart';
import 'package:todo_app/features/splash/presentation/screens/splash_screen.dart';
import 'package:todo_app/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:todo_app/features/dashboard/presentation/dashboard_binding.dart';
import 'package:todo_app/features/settings/presentation/screens/settings_screen.dart';
import 'package:todo_app/core/routing/route_constants.dart';
import 'package:todo_app/core/routing/go_router_refresh_stream.dart';
import 'dart:developer' as developer;

class AppRouter {
  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: RouteConstants.splashPath,
    debugLogDiagnostics: true,
    refreshListenable: GoRouterRefreshStream(Get.find<AuthBloc>().stream),
    routes: [
      GoRoute(
        name: RouteConstants.splashName,
        path: RouteConstants.splashPath,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        name: RouteConstants.loginName,
        path: RouteConstants.loginPath,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        name: RouteConstants.registerName,
        path: RouteConstants.registerPath,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        name: RouteConstants.dashboardName,
        path: RouteConstants.dashboardPath,
        builder: (context, state) {
          DashboardBinding().dependencies();
          return const DashboardScreen();
        },
      ),
      GoRoute(
        name: RouteConstants.settingsName,
        path: RouteConstants.settingsPath,
        builder: (context, state) {
          // Ensure SettingsCubit is available if not provided globally yet,
          // but we will provide it globally in main.dart
          return const SettingsScreen();
        },
      ),
    ],
    redirect: (context, state) {
      final authBloc = Get.find<AuthBloc>();
      final stateLocation = state.matchedLocation;
      final authState = authBloc.state;

      developer.log(
        'GoRouter Redirect Check: Current location: $stateLocation, AuthState: $authState',
      );

      // Check if auth state is determined
      final isDetermined = authState.maybeWhen(
        authenticated: (_) => true,
        unauthenticated: () => true,
        error: (_) => true,
        orElse: () => false,
      );

      final isSplashRoute = stateLocation == RouteConstants.splashPath;

      if (isSplashRoute) {
        if (!isDetermined) {
          developer.log(
            'GoRouter Redirect: Auth not determined yet, staying on Splash.',
          );
          return null;
        }

        final destination = authState.maybeWhen(
          authenticated: (_) => RouteConstants.dashboardPath,
          orElse: () => RouteConstants.loginPath,
        );
        developer.log(
          'GoRouter Redirect: Auth determined, redirecting from Splash to $destination',
        );
        return destination;
      }

      final isAuthenticated = authState.maybeWhen(
        authenticated: (_) => true,
        orElse: () => false,
      );

      final isAuthRoute =
          stateLocation == RouteConstants.loginPath ||
          stateLocation == RouteConstants.registerPath;

      if (!isAuthenticated && !isAuthRoute) {
        developer.log(
          'GoRouter Redirect: Not authenticated and not on auth route, redirecting to Login.',
        );
        return RouteConstants.loginPath;
      }

      if (isAuthenticated && isAuthRoute) {
        developer.log(
          'GoRouter Redirect: Authenticated but on auth route, redirecting to Dashboard.',
        );
        return RouteConstants.dashboardPath;
      }

      developer.log('GoRouter Redirect: No redirect needed.');
      return null;
    },
  );
}
