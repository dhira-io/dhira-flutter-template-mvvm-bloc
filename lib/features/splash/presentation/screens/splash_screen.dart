import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:todo_app/features/auth/presentation/bloc/auth_event.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final authBloc = context.read<AuthBloc>();
      final isInitial = authBloc.state.maybeWhen(
        initial: () => true,
        orElse: () => false,
      );
      if (isInitial) {
        authBloc.add(AuthCheckRequested());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Using a simple icon as a placeholder for branding
            Icon(Icons.check_circle_outline, size: 80, color: Colors.blue),
            SizedBox(height: 24),
            Text(
              'Todo App',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            SizedBox(height: 48),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
