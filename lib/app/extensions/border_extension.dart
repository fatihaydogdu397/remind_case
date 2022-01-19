import 'package:flutter/material.dart';

import 'responsive_extension.dart';

//bu sayfa ve bundan sonraki extensions sayfalarında kolaylık, standartlaştırma ve daha
//clean kod yazmak için bu tarz kendi fonksiyonlarımı oluşturmuştum genelde herhangi
//bir projeye başlarsam bunları en başta ekliyorum

extension BorderRadiusExtension on BuildContext {
  BorderRadius get lowCircular => BorderRadius.circular(8);
  BorderRadius get mediumCircular => BorderRadius.circular(15);
  BorderRadius get medHighCircular => BorderRadius.circular(20);
  BorderRadius get highCircular => BorderRadius.circular(30);
  BorderRadius get extremeCircular => BorderRadius.circular(40);
}

extension BorderRadiusOnlyExtensionn on BuildContext {
  Radius get lowRadius => const Radius.circular(8);
  Radius get medRadius => const Radius.circular(15);
  Radius get medHighRadius => const Radius.circular(20);
  Radius get highRadius => const Radius.circular(30);
  Radius get extremeRadius => const Radius.circular(40);
}

extension ShapeBorderExtension on BuildContext {
  ShapeBorder get roundedRectangularLow =>
      RoundedRectangleBorder(borderRadius: lowCircular);
  ShapeBorder get roundedRectangularMedium =>
      RoundedRectangleBorder(borderRadius: mediumCircular);
  ShapeBorder get roundedRectangularHigh =>
      RoundedRectangleBorder(borderRadius: highCircular);
  ShapeBorder get roundedRectangularExtreme =>
      RoundedRectangleBorder(borderRadius: extremeCircular);
}

extension BoxBorderExtension on BuildContext {
  BoxBorder get defaultBlackBoxBorder =>
      Border.all(color: Colors.black26, width: width * .05);
  BoxBorder get defaultGreyBoxBorder =>
      Border.all(color: Colors.blueGrey, width: width * .1);
}
