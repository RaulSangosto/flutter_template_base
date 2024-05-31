import 'dart:async';
import 'package:flutter/material.dart';
import '../../core/common/base/base_viewmodel.dart';

class HomeViewModel extends BaseViewModel {
  final Map<String, String> routeSettings;

  HomeViewModel(@factoryParam this.routeSettings);

  final GetThemeModeUseCase _getThemeModeUseCase = getIt<GetThemeModeUseCase>();
  final SetThemeModeUseCase _setThemeModeUseCase = getIt<SetThemeModeUseCase>();

  late ThemeMode _themeMode;
  ThemeMode get themeMode => _themeMode;

  StreamSubscription<ThemeMode?>? _themeModeSubscription;

  @override
  void init() {
    // TODO: implement init
    _themeModeSubscription = _getThemeModeUseCase().listen((data) {
      if (data != null) {
        _themeMode = data;
        notifyListeners();
      }
    });
  }

  @override
  void dispose() {
    _themeModeSubscription?.cancel();
    _themeModeSubscription = null;
    super.dispose();
  }

  changeThemeMode() {
    final theme =
        ThemeMode.values[((_themeMode.index + 1) % ThemeMode.values.length)];
    _setThemeModeUseCase(theme);
  }
}
