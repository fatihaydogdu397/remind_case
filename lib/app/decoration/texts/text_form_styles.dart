import 'package:flutter/material.dart';
import 'package:re_mind_case/app/extensions/context_extensions_shelf.dart';

class TextFormDeco {
  static final TextFormDeco _instance = TextFormDeco();
  static TextFormDeco get instance => _instance;

  InputDecoration textFormDecoration(
    BuildContext context,
    String hintTextKey,
  ) {
    return InputDecoration(
      filled: true,
      fillColor: context.secondaryColor,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 4,
      ),
      labelText: hintTextKey,
      labelStyle: context.headline4.copyWith(
        color: context.textColor,
      ),
      hintStyle: context.headline4.copyWith(
        color: context.textColor,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: context.medHighCircular,
        borderSide: BorderSide(width: 1, color: context.primaryColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: context.medHighCircular,
        borderSide: BorderSide(width: 1, color: context.primaryColor),
      ),
    );
  }
}
