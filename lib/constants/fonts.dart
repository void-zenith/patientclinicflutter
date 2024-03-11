import 'package:flutter/material.dart';
import 'package:patientclinicflutter/constants/const.dart';

class ConstFonts {
  static String nunito = "nunito";
}

class ConstSizes {
  static double extraSmallSize = 12,
      smallSize = 14,
      regularSize = 16,
      largeSize = 18,
      extraLarge = 20,
      doubleLarge = 24;
}

class TextStyles {
  static regular(
      {String? label,
      Color? textColor = Colors.black,
      double? textSize,
      FontWeight? textWeight,
      TextAlign? alignment = TextAlign.left}) {
    return label?.text
        .size(textSize)
        .fontWeight(textWeight!)
        .color(textColor)
        .align(alignment!)
        .make();
  }
}
