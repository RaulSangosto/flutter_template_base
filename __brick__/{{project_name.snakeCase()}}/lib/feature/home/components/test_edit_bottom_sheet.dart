import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/model/test/test_model.dart';
import '../../../core/ui/components/bottom_sheet.dart';
import '../../../core/ui/components/buttons.dart';

class TestEditBottomSheet extends StatefulWidget {
  final TestModel? test;
  final ValueChanged<TestModel> onSave;
  const TestEditBottomSheet({
    super.key,
    required this.onSave,
    this.test,
  });

  @override
  State<TestEditBottomSheet> createState() => _TestEditBottomSheetState();
}

class _TestEditBottomSheetState extends State<TestEditBottomSheet> {
  late TestModel test;
  late TextEditingController controller;

  changeTest(String text) {
    setState(() {
      test = test.copyWith(title: text);
    });
  }

  @override
  void initState() {
    test = widget.test ?? TestModel();
    controller = TextEditingController(text: test.title);
    super.initState();
  }

  void onSave() {
    widget.onSave(test);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheetContent(title: "test_edit_sheet_title", items: [
      Form(
          child: Column(
        children: [
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              label: const Text("test_label_edit_field").tr(),
              hintText: "test_hint_edit_field".tr(),
            ),
            onChanged: changeTest,
            onEditingComplete: onSave,
          ),
          PrimaryIconButton(
            text: Text(test.id == null
                    ? "test_add_sheet_btn"
                    : "test_edit_sheet_btn")
                .tr(),
            icon: const FaIcon(FontAwesomeIcons.plus),
            onPressed: onSave,
          ),
        ],
      )),
    ]);
  }
}
