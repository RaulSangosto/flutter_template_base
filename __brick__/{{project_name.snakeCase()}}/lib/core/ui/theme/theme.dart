import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

final TextTheme baseLightTextTheme = Typography().black.apply(
      bodyColor: darkColor,
      displayColor: secondaryColor,
    );

final TextTheme lightTextTheme =
    GoogleFonts.poppinsTextTheme(baseLightTextTheme);

final ThemeData lightTheme = ThemeData.from(
  useMaterial3: true,
  colorScheme: const ColorScheme.light(
    primary: primaryLight,
    onPrimary: white,
    primaryContainer: primaryContainerLight,
    onPrimaryContainer: white,
    surface: background,
    onSurface: darkColor,
    surfaceContainer: white,
    surfaceContainerHigh: greyBackground,
    onSurfaceVariant: greySecondary,
    secondary: secondaryDarkColor,
    onSecondary: white,
    tertiary: premiumColor,
    onTertiary: darkColor,
    outline: darkGreyBackground,
    outlineVariant: secondaryDarkColor,
  ),
  textTheme: lightTextTheme,
).copyWith(
  appBarTheme: transparentLightAppBar,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: primaryLight,
    foregroundColor: white,
  ),
  iconTheme: const IconThemeData(color: secondaryDarkColor),
  listTileTheme: ListTileThemeData(
    titleTextStyle: lightTextTheme.titleMedium,
    subtitleTextStyle:
        lightTextTheme.bodySmall?.copyWith(color: secondaryColor),
  ),
);

final TextTheme baseDarkTextTheme = Typography().white.apply(
      bodyColor: background,
      displayColor: secondaryColor,
    );

final TextTheme darkTextTheme = GoogleFonts.poppinsTextTheme(baseDarkTextTheme);

final ThemeData darkTheme = ThemeData.from(
        useMaterial3: true,
        colorScheme: const ColorScheme.dark(
          primary: primaryDark,
          onPrimary: white,
          primaryContainer: primaryContainerDark,
          onPrimaryContainer: white,
          surfaceContainer: blackColor,
          surface: darkColor,
          surfaceContainerHigh: darkGreyColor,
          onSurface: background,
          onSurfaceVariant: secondaryColor,
          secondary: secondaryColor,
          onSecondary: blackColor,
          tertiary: premiumColor,
          onTertiary: darkColor,
          outline: darkGreyColor,
          outlineVariant: darkGreySecondary,
        ),
        textTheme: darkTextTheme)
    .copyWith(
      appBarTheme: transparentDarkAppBar,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primaryDark,
        foregroundColor: white,
      ),
      iconTheme: const IconThemeData(color: secondaryColor),
      listTileTheme: ListTileThemeData(
        titleTextStyle: darkTextTheme.titleMedium,
        subtitleTextStyle:
            darkTextTheme.bodySmall?.copyWith(color: darkGreySecondary),
      ),
    )
    .copyWith(dividerColor: secondaryColor.withOpacity(.8));

final AppBarTheme transparentLightAppBar = AppBarTheme(
  elevation: 0,
  scrolledUnderElevation: 0,
  color: Colors.transparent,
  foregroundColor: darkColor,
  shadowColor: null,
  surfaceTintColor: null,
  systemOverlayStyle:
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
  centerTitle: true,
);

final AppBarTheme transparentDarkAppBar = AppBarTheme(
  elevation: 0,
  scrolledUnderElevation: 0,
  color: Colors.transparent,
  foregroundColor: white,
  shadowColor: Colors.transparent,
  surfaceTintColor: Colors.transparent,
  systemOverlayStyle:
      SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent),
  centerTitle: true,
);
