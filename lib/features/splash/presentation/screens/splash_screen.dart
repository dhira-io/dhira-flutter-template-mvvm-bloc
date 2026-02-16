import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhira_flutter_template/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:dhira_flutter_template/features/auth/presentation/bloc/auth_event.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) return;

      // Delay for 1 minute for flow mocking
      await Future.delayed(const Duration(seconds: 3));

      if (!mounted) return;

      final authBloc = context.read<AuthBloc>();
      // Trigger auth check if it's in initial state
      authBloc.state.maybeWhen(
        initial: () => authBloc.add(AuthCheckRequested()),
        orElse: () {},
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle_outline, size: 80, color: Colors.blue),
            SizedBox(height: 24),
            Text(
              'Dhira App Template',
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
