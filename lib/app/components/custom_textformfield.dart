import 'package:flutter/material.dart';
import 'package:re_mind_case/app/decoration/texts/text_form_styles.dart';
import 'package:re_mind_case/app/extensions/context_extensions_shelf.dart';

class CustomTextFormField extends StatelessWidget {
  final Function(String) onChanged;
  final String hintTextKey;
  final bool visibility;
  final TextEditingController? textEditingController;
  final Function()? changeVisibility;
  const CustomTextFormField({
    required this.onChanged,
    this.hintTextKey = '',
    this.visibility = false,
    this.changeVisibility,
    Key? key,
    this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      scrollPadding: context.lowEdgeInsets,
      decoration: TextFormDeco.instance
          .textFormDecoration(
            context,
            hintTextKey,
          )
          .copyWith(
            fillColor: context.secondaryColor,
            contentPadding: EdgeInsets.symmetric(
                vertical: context.height, horizontal: context.width * 2),
            enabledBorder: OutlineInputBorder(
              borderRadius: context.lowCircular,
              borderSide: BorderSide(width: 1, color: context.textColor),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            hintText: hintTextKey,
            hintStyle: context.headline5.copyWith(
                color: context.textColor,
                fontSize: (context.width + context.height) / .7),
            focusedBorder: OutlineInputBorder(
              borderRadius: context.lowCircular,
              borderSide: BorderSide(width: 1, color: context.textColor),
            ),
          ),
      onChanged: onChanged,
    );
  }
}
