import '../core/data/repository/preferences_repository.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../../app/di/injectable.dart';

@injectable
class SetThemeModeUseCase {
  final PreferencesRepository _repository = getIt<PreferencesRepository>();

  Future<void> call(ThemeMode mode) {
    return _repository.setThemeMode(mode);
  }
}
