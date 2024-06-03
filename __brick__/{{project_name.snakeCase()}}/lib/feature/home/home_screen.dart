import 'package:easy_localization/easy_localization.dart';

import '../../core/common/base/base_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/model/test/test_model.dart';
import '../../core/ui/components/empty_widget.dart';
import '../../core/ui/components/loading_screen.dart';
import '../../core/ui/components/settings_sheet.dart';
import 'components/home_list_item.dart';
import 'components/test_edit_bottom_sheet.dart';
import 'home_viewmodel.dart';
import 'interactions/home_event.dart';

class HomeScreen extends BaseView<HomeViewModel> {
  const HomeScreen({super.key, required super.routeParameters});

  static const routeName = 'home';

  @override
  Widget build(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Scaffold(
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
                themeMode: viewModel.state.themeMode,
              ),
            ),
            icon: const FaIcon(FontAwesomeIcons.gear),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            showTestEditBottomSheet(context, null, viewModel.onEvent),
        child: const FaIcon(FontAwesomeIcons.plus),
      ),
      body: Builder(builder: (context) {
        if (viewModel.state.isLoading) {
          return const LoadingScreen();
        }
        return HomeScreenContent(
          tests: viewModel.state.tests,
          onDeleteItem: (item) => viewModel.onEvent(OnDeleteTestEvent(item)),
          onClickItem: (item) => viewModel.onEvent(OnAddTestEvent(item)),
          onEvent: viewModel.onEvent,
        );
      }),
    );
  }
}

class HomeScreenContent extends StatelessWidget {
  final List<TestModel> tests;
  final ValueChanged<HomeEvent> onEvent;
  final ValueChanged<TestModel> onDeleteItem;
  final ValueChanged<TestModel> onClickItem;

  const HomeScreenContent({
    super.key,
    required this.tests,
    required this.onDeleteItem,
    required this.onClickItem,
    required this.onEvent,
  });

  @override
  Widget build(BuildContext context) {
    if (tests.isEmpty) {
      return Center(
        child: EmptyWidget(title: "home_empty_widget_title".tr()),
      );
    }
    return ListView.separated(
      itemBuilder: (context, index) => HomeListItem(
        test: tests[index],
        onClickItem: (item) => showTestEditBottomSheet(context, item, onEvent),
        onDeleteItem: onDeleteItem,
      ),
      separatorBuilder: (context, index) => const Divider(),
      itemCount: tests.length,
    );
  }
}

void showTestEditBottomSheet(
  BuildContext context,
  TestModel? test,
  ValueChanged<HomeEvent> onEvent,
) {
  showModalBottomSheet(
    context: context,
    builder: (context) => TestEditBottomSheet(
      onSave: (test) => onEvent(OnAddTestEvent(test)),
      test: test,
    ),
  );
}
