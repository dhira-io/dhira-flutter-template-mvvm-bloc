import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:dhira_flutter_template/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:dhira_flutter_template/features/auth/presentation/screens/login_screen.dart';
import 'package:dhira_flutter_template/features/auth/presentation/screens/register_screen.dart';
import 'package:dhira_flutter_template/features/dashboard/dashboard_screen.dart';
import 'package:dhira_flutter_template/core/routing/route_constants.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: RouteConstants.loginPath,
    debugLogDiagnostics: true,
    routes: [
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
    ],
    redirect: (context, state) {
      final authBloc = Get.find<AuthBloc>();
      final stateLocation = state.matchedLocation;

      final isAuthenticated = authBloc.state.maybeWhen(
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
