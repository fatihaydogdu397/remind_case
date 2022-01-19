import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:re_mind_case/app/extensions/context_extensions_shelf.dart';

class CustomButton extends StatelessWidget {
  final String buttonTextKey;
  final Function()? action;
  final Color backgroundColor;
  final Color? borderColor;
  final String iconPath;
  final BorderRadius? borderRadius;
  final double borderWidth;
  final TextStyle? textStyle;
  final double? height;
  const CustomButton({
    required this.buttonTextKey,
    this.action,
    required this.backgroundColor,
    this.borderColor,
    this.iconPath = '',
    this.borderRadius,
    this.borderWidth = 2.0,
    Key? key,
    this.textStyle,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(const Size.fromHeight(50)),
        backgroundColor: MaterialStateProperty.all(backgroundColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: context.lowCircular,
          ),
        ),
      ),
      onPressed: action,
      child: Row(
        children: [
          const Spacer(),
          Expanded(
            flex: 7,
            child: AutoSizeText(buttonTextKey,
                textAlign: TextAlign.center,
                maxLines: 1,
                style: textStyle ?? context.headline4.copyWith(fontSize: 23)),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
