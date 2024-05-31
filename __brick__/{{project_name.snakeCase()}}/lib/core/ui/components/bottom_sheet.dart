import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomSheetContent extends StatelessWidget {
  final Widget title;
  final List<Widget> items;
  final Widget? emptyWidget;
  const BottomSheetContent({
    super.key,
    required this.items,
    required this.title,
    this.emptyWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: title),
              IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const FaIcon(FontAwesomeIcons.xmark))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Scrollbar(
              //trackVisibility: true,
              thumbVisibility: true,
              child: items.isNotEmpty
                  ? ListView.separated(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      itemCount: items.length,
                      itemBuilder: (context, index) => items[index],
                      separatorBuilder: (context, index) => const Divider(),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50.0),
                      child: emptyWidget,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
