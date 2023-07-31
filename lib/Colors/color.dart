import 'package:flutter/material.dart';

import 'dart:ui';
import 'dart:ui' show Color;

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

const Color accent = Color.fromRGBO(255, 170, 76, 1);
const Color black = Color(0xff000000);
const kAccentColorButton = Color.fromARGB(255, 3, 82, 151);

class MaterialColors {
  static const Color primary = Color.fromARGB(255, 250, 159, 56);
  static const Color primary2 = Color(0xfff7892b);
  static const Color black = Color.fromRGBO(24, 23, 37, 1.0);
  static const Color secondary = Color.fromARGB(255, 6, 88, 155);
  static const Color white = Color.fromARGB(255, 255, 255, 255);
  static const Color grey = Color.fromRGBO(245, 245, 245, 1);
  static const Color success = Color.fromARGB(255, 0, 184, 116);
  static const Color orange = Color.fromARGB(2255, 255, 60, 0);
}
