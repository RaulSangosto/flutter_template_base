import 'package:cv_creator/core/data/repository/preferences_repository.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../../app/di/injectable.dart';

@injectable
class GetThemeModeUseCase {
  final PreferencesRepository _repository = getIt<PreferencesRepository>();

  Stream<ThemeMode?> call() {
    return _repository.getThemeMode();
  }
}
