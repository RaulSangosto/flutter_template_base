import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomSheetContent extends StatelessWidget {
  final String title;
  final Widget content;
  const BottomSheetContent({
    super.key,
    required this.title,
    required this.content,
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
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ).tr(),
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const FaIcon(FontAwesomeIcons.xmark),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(child: content),
        ],
      ),
    );
  }
}
