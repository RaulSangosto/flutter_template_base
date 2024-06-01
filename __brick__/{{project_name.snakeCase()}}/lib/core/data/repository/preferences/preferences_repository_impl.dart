import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';
import '../../../common/constants.dart';
import 'preferences_repository.dart';

@Singleton(as: PreferencesRepository)
class PreferencesRepositoryImpl extends PreferencesRepository {
  final preferences = RxSharedPreferences.getInstance();

  @override
  Stream<ThemeMode> getThemeMode() {
    return preferences.getIntStream(themeModePreferencesKey).asyncMap(
        (value) => value != null ? ThemeMode.values[value] : ThemeMode.system);
  }

  @override
  Future<void> setThemeMode(ThemeMode mode) {
    return preferences.setInt(themeModePreferencesKey, mode.index);
  }
}
