import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../constants/app_constants.dart';

class SettingsRepository {
  final Box _settingsBox = Hive.box(AppConstants.settingsBoxName);

  static const String _themeModeKey = 'theme_mode';
  static const String _localeKey = 'locale';

  ThemeMode getThemeMode() {
    final themeStr = _settingsBox.get(_themeModeKey, defaultValue: 'system');
    return ThemeMode.values.firstWhere(
      (e) => e.toString() == 'ThemeMode.$themeStr',
      orElse: () => ThemeMode.system,
    );
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    await _settingsBox.put(_themeModeKey, mode.name);
  }

  Locale? getLocale() {
    final localeCode = _settingsBox.get(_localeKey);
    if (localeCode == null) return null;
    return Locale(localeCode);
  }

  Future<void> setLocale(Locale locale) async {
    await _settingsBox.put(_localeKey, locale.languageCode);
  }
}
