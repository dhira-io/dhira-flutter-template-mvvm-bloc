import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:dhira_flutter_template/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:dhira_flutter_template/features/auth/presentation/screens/login_screen.dart';
import 'package:dhira_flutter_template/features/auth/presentation/screens/register_screen.dart';
import 'package:dhira_flutter_template/features/splash/presentation/screens/splash_screen.dart';
import 'package:dhira_flutter_template/features/dashboard/dashboard_screen.dart';
import 'package:dhira_flutter_template/features/settings/presentation/screens/settings_screen.dart';
import 'package:dhira_flutter_template/core/routing/route_constants.dart';
import 'package:dhira_flutter_template/core/routing/go_router_refresh_stream.dart';

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
        builder: (context, state) => const DashboardScreen(),
      ),
      GoRoute(
        name: RouteConstants.settingsName,
        path: RouteConstants.settingsPath,
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
    redirect: (context, state) {
      final authBloc = Get.find<AuthBloc>();
      final stateLocation = state.matchedLocation;
      final authState = authBloc.state;

      // Check if auth state is determined
      final bool isDetermined = authState.maybeWhen(
        authenticated: (_) => true,
        unauthenticated: () => true,
        error: (_) => true,
        orElse: () => false,
      );

      final isSplashRoute = stateLocation == RouteConstants.splashPath;

      if (isSplashRoute) {
        if (!isDetermined) return null;

        return authState.maybeWhen(
          authenticated: (_) => RouteConstants.dashboardPath,
          orElse: () => RouteConstants.loginPath,
        );
      }

      final isAuthenticated = authState.maybeWhen(
        authenticated: (_) => true,
        orElse: () => false,
      );

      final isAuthRoute =
          stateLocation == RouteConstants.loginPath ||
          stateLocation == RouteConstants.registerPath;

      if (!isAuthenticated && !isAuthRoute) {
        return RouteConstants.loginPath;
      }

      if (isAuthenticated && isAuthRoute) {
        return RouteConstants.dashboardPath;
      }

      return null;
    },
  );
}
