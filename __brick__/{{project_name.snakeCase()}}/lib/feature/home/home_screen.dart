import '../../core/common/base/base_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/ui/components/settings_sheet.dart';
import 'home_viewmodel.dart';

class HomeScreen extends BaseView<HomeViewModel> {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = 'home';

  @override
  Widget build(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Scafold(
      appBar: AppBar(
        title: const Text("home_screen_title").tr(),
        actions: [
          IconButton(
            onPressed: () => showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(30))),
              builder: (context) => SettingsSheetContent(
                onChangeThemeMode: () => viewModel.changeThemeMode(),
                themeMode: viewModel.themeMode,
              ),
            ),
            icon: const FaIcon(FontAwesomeIcons.gear),
          ),
        ],
      ),
      body: const Center(
        child: Text("home_body_text").tr(),
      ),
    );
  }
}
