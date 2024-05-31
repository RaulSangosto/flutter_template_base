import 'package:flutter/material.dart';

abstract class PreferencesRepository {
  Stream<ThemeMode> getThemeMode();
  Future<void> setThemeMode(ThemeMode mode);
}
