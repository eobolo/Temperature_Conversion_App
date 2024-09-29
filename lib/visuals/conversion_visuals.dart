import 'package:flutter/material.dart';

class TextVisuals {
  static TextStyle getTextStyle(double userFontSize, double userFontWeight, int alpha, int red, int green, int blue) {
    return TextStyle(
        color: Color.fromARGB(alpha, red, green, blue),
        fontSize: userFontSize,
        fontVariations: [FontVariation.weight(userFontWeight)],
        fontFamily: "Arial",
        fontStyle: FontStyle.normal);
  }
}