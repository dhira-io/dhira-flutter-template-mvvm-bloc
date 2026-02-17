import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/storage/settings_repository.dart';
import 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final SettingsRepository _repository;

  SettingsCubit(this._repository)
    : super(
        SettingsState(
          themeMode: _repository.getThemeMode(),
          locale: _repository.getLocale() ?? const Locale('en'),
        ),
      );

  Future<void> updateThemeMode(ThemeMode mode) async {
    await _repository.setThemeMode(mode);
    emit(state.copyWith(themeMode: mode));
  }

  Future<void> updateLocale(Locale locale) async {
    await _repository.setLocale(locale);
    emit(state.copyWith(locale: locale));
  }
}
