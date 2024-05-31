import '../app/router.dart';
import '../core/common/constants.dart';
import '../core/ui/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  MyApp({
    super.key,
  });

  final preferences = RxSharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: preferences.getIntStream(themeModePreferencesKey),
      builder: ((context, snapshot) => getMaterialApp(
          context,
          snapshot.data != null
              ? ThemeMode.values[snapshot.data!]
              : ThemeMode.system)),
    );
  }

  MaterialApp getMaterialApp(BuildContext context, ThemeMode thememode) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: NavigationService.router,
      restorationScopeId: 'app',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: "{{project_name}}",
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: thememode,
    );
  }
}
