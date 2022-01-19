import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  Color get primaryColor => const Color(0xFFF8F6F2);
  Color get secondaryColor => const Color(0xffffffff);
  Color get borderEnableColor => const Color(0xFFFD4141);
  Color get borderDisableColor => const Color(0xFF9B9281);
  Color get textColor => const Color(0xFF303030);
  Color get buttonEnableColor => const Color(0xFF083134);
  Color get buttonDisableColor => const Color(0xFFB0BEBC);

  TextStyle get headline1 => theme.textTheme.headline1!
      .copyWith(fontSize: 40, fontWeight: FontWeight.bold, color: textColor);
  TextStyle get headline2 => theme.textTheme.headline2!
      .copyWith(fontSize: 30, fontWeight: FontWeight.w600, color: textColor);
  TextStyle get headline3 =>
      theme.textTheme.headline3!.copyWith(fontSize: 25, color: textColor);
  TextStyle get headline4 =>
      theme.textTheme.headline4!.copyWith(fontSize: 20, color: textColor);
  TextStyle get headline5 =>
      theme.textTheme.headline5!.copyWith(fontSize: 18, color: textColor);
  TextStyle get headline6 =>
      theme.textTheme.headline6!.copyWith(fontSize: 16, color: textColor);
}
