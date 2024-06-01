import 'package:example_project_name2/core/model/test/test_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeListItem extends StatelessWidget {
  final TestModel test;
  final ValueChanged<TestModel> onClickItem;
  final ValueChanged<TestModel> onDeleteItem;
  const HomeListItem({
    super.key,
    required this.test,
    required this.onClickItem,
    required this.onDeleteItem,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(test.title),
      onTap: () => onClickItem(test),
      leading: const FaIcon(FontAwesomeIcons.crown),
      trailing: IconButton(
        onPressed: () => onDeleteItem(test),
        icon: const FaIcon(FontAwesomeIcons.trashCan),
      ),
    );
  }
}
