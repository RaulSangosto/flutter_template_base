import 'package:flutter/material.dart';

import '../../../core/model/test/test_model.dart';

class HomeState {
  final List<TestModel> tests;
  final bool isLoading;
  final ThemeMode themeMode;

  const HomeState({
    this.isLoading = false,
    this.themeMode = ThemeMode.system,
    this.tests = const [],
  });

  HomeState copyWith({
    List<TestModel>? tests,
    bool? isLoading,
    ThemeMode? themeMode,
  }) {
    return HomeState(
      tests: tests ?? this.tests,
      isLoading: isLoading ?? this.isLoading,
      themeMode: themeMode ?? this.themeMode,
    );
  }
}
