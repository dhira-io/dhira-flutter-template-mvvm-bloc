import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/dialogs/app_dialogs.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_event.dart';
import '../bloc/settings_cubit.dart';
import '../bloc/settings_state.dart';
import '../widgets/settings_section.dart';
import '../widgets/settings_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.backgroundDark
          : AppColors.backgroundLight,
      appBar: AppBar(
        title: Text(
          l10n.settings,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: isDark
            ? AppColors.textPrimaryDark
            : AppColors.textPrimaryLight,
      ),
      body: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return ListView(
            padding: const EdgeInsets.symmetric(vertical: 16),
            children: [
              SettingsSection(
                title: l10n.general,
                children: [
                  // Theme Toggle
                  SettingsTile(
                    icon: isDark ? Icons.dark_mode : Icons.light_mode,
                    iconColor: AppColors.primary,
                    title: l10n.theme,
                    subtitle: isDark ? l10n.darkMode : l10n.lightMode,
                    trailing: Switch.adaptive(
                      value: isDark,
                      activeTrackColor: AppColors.primary,
                      onChanged: (value) {
                        context.read<SettingsCubit>().updateThemeMode(
                          value ? ThemeMode.dark : ThemeMode.light,
                        );
                      },
                    ),
                  ),
                  Divider(
                    height: 1,
                    indent: 70,
                    color: isDark ? Colors.grey[800] : const Color(0xFFEEEEEE),
                  ),

                  // Language Selection
                  SettingsTile(
                    icon: Icons.language,
                    iconColor: AppColors.secondary,
                    title: l10n.language,
                    subtitle: _getLanguageName(state.locale.languageCode, l10n),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.grey,
                    ),
                    onTap: () => _showLanguageBottomSheet(context),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              SettingsSection(
                title: l10n.account,
                children: [
                  SettingsTile(
                    icon: Icons.logout_rounded,
                    iconColor: AppColors.error,
                    title: l10n.logout,
                    onTap: () {
                      AppDialogs.showConfirmationDialog(
                        context,
                        title: l10n.logout,
                        message: l10n.logoutConfirmation,
                        onConfirm: () {
                          context.read<AuthBloc>().add(AuthLogoutRequested());
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  String _getLanguageName(String code, AppLocalizations l10n) {
    switch (code) {
      case 'hi':
        return l10n.hindi;
      default:
        return l10n.english;
    }
  }

  void _showLanguageBottomSheet(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    showModalBottomSheet(
      context: context,
      backgroundColor: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 12, bottom: 24),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Text(
                l10n.selectLanguage,
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildLanguageOption(
                context,
                title: l10n.english,
                code: 'en',
                isSelected: _isSelected('en', context),
              ),
              _buildLanguageOption(
                context,
                title: l10n.hindi,
                code: 'hi',
                isSelected: _isSelected('hi', context),
              ),
              const SizedBox(height: 24),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLanguageOption(
    BuildContext context, {
    required String title,
    required String code,
    required bool isSelected,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 24),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          color: isSelected ? AppColors.primary : null,
        ),
      ),
      trailing: isSelected
          ? const Icon(Icons.check, color: AppColors.primary)
          : null,
      onTap: () {
        context.read<SettingsCubit>().updateLocale(Locale(code));
        Navigator.pop(context);
      },
    );
  }

  bool _isSelected(String code, BuildContext context) {
    return context.read<SettingsCubit>().state.locale.languageCode == code;
  }
}
