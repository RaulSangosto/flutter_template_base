import 'package:flutter/material.dart';

abstract class PreferencesRepository {
  Stream<ThemeMode> getThemeMode();
  Stream<bool> getIsPro();

  Future<void> setThemeMode(ThemeMode mode);
  Future<void> setIsPro(bool isPro);
}
