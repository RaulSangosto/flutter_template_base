import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'bottom_sheet.dart';

class SettingsSheetContent extends StatelessWidget {
  final VoidCallback onChangeThemeMode;
  final ThemeMode themeMode;
  const SettingsSheetContent({
    super.key,
    required this.onChangeThemeMode,
    required this.themeMode,
  });

  @override
  Widget build(BuildContext context) {
    return BottomSheetContent(
      items: [
        ListTile(
          leading: const FaIcon(FontAwesomeIcons.circleHalfStroke),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                themeMode.name.toUpperCase(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox.square(
                dimension: 10,
              ),
              FaIcon(getIconFromThemeMode(themeMode))
            ],
          ),
          title: const Text("theme_mode_settings_title").tr(),
          onTap: onChangeThemeMode,
        ),
      ],
      title: "settings_sheet_title",
    );
  }

  IconData getIconFromThemeMode(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.system:
        return FontAwesomeIcons.circleHalfStroke;
      case ThemeMode.light:
        return FontAwesomeIcons.sun;
      case ThemeMode.dark:
        return FontAwesomeIcons.moon;
    }
  }
}
