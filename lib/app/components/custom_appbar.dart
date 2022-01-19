import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:re_mind_case/app/extensions/context_extensions_shelf.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: context.buttonEnableColor),
      backgroundColor: context.primaryColor,
      centerTitle: true,
      title: AutoSizeText(
        title,
        style: context.headline4
            .copyWith(color: context.textColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
