import 'dart:async';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../../app/di/injectable.dart';
import '../../core/common/base/base_viewmodel.dart';
import '../../core/domain/test/add_test_use_case.dart';
import '../../core/domain/test/delete_test_use_case.dart';
import '../../core/domain/test/get_tests_use_case.dart';
import '../../core/domain/theme/get_theme_mode_use_case.dart';
import '../../core/domain/theme/set_theme_mode_use_case.dart';
import '../../core/model/test/test_model.dart';
import 'interactions/home_event.dart';
import 'interactions/home_state.dart';

@injectable
class HomeViewModel extends BaseViewModel {
  final Map<String, String> routeSettings;

  HomeViewModel(@factoryParam this.routeSettings);

  final GetThemeModeUseCase _getThemeModeUseCase = getIt<GetThemeModeUseCase>();
  final SetThemeModeUseCase _setThemeModeUseCase = getIt<SetThemeModeUseCase>();
  final GetTestsUseCase _getTestsUseCase = getIt<GetTestsUseCase>();
  final AddTestUseCase _addTestUseCase = getIt<AddTestUseCase>();
  final DeleteTestUseCase _deleteTestUseCase = getIt<DeleteTestUseCase>();

  HomeState _state = const HomeState();
  HomeState get state => _state;

  StreamSubscription<ThemeMode?>? _themeModeSubscription;
  StreamSubscription<List<TestModel>>? _testsSubscription;

  @override
  void init() {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();
    _themeModeSubscription = _getThemeModeUseCase().listen((data) {
      if (data != null) {
        _state = _state.copyWith(themeMode: data);
        notifyListeners();
      }
    });
    _testsSubscription = _getTestsUseCase().listen((data) {
      _state = _state.copyWith(tests: data, isLoading: false);
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _themeModeSubscription?.cancel();
    _themeModeSubscription = null;
    _testsSubscription?.cancel();
    _testsSubscription = null;
    super.dispose();
  }

  changeThemeMode() {
    final theme = ThemeMode
        .values[((_state.themeMode.index + 1) % ThemeMode.values.length)];
    _setThemeModeUseCase(theme);
  }

  onEvent(HomeEvent event) {
    switch (event) {
      case OnAddTestEvent _:
        _addTestUseCase(event.test);
        break;
      case OnDeleteTestEvent _:
        _deleteTestUseCase(event.test);
        break;
      case OnChangeTestTitleEvent _:
        _addTestUseCase(event.test);
        break;
    }
  }
}
