import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/routing/route_constants.dart';
import '../../../../../core/utils/snackbar_utils.dart';
import '../../../../../shared/components/app_button.dart';
import '../../../../../shared/components/app_text_field.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';

import 'package:todo_app/l10n/app_localizations.dart';
import '../widgets/social_auth_buttons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLogin() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<AuthBloc>().add(
        AuthLoginRequested(
          username: _usernameController.text,
          password: _passwordController.text,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          state.maybeWhen(
            authenticated: (_) {
              SnackbarUtils.showSuccess(context, 'Login Successful!');
              },
            error: (message) => SnackbarUtils.showError(context, message),
            orElse: () {},
          );
        },
        builder: (context, state) {
          final isLoading = state.maybeWhen(
            loading: () => true,
            orElse: () => false,
          );

          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      l10n.welcomeBack,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 48),
                    AppTextField(
                      controller: _usernameController,
                      labelText: 'Username',
                      prefixIcon: const Icon(Icons.person_outline),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return l10n.fieldRequired;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    AppTextField(
                      controller: _passwordController,
                      labelText: l10n.password,
                      prefixIcon: const Icon(Icons.lock_outline),
                      obscureText: _obscurePassword,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: () => setState(
                          () => _obscurePassword = !_obscurePassword,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return l10n.fieldRequired;
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    AppButton(
                      text: l10n.login,
                      isLoading: isLoading,
                      onPressed: _onLogin,
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () =>
                          context.push(RouteConstants.registerPath),
                      child: Text(l10n.dontHaveAccountRegister),
                    ),
                    const SizedBox(height: 24),
                    const SocialAuthButtons(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
