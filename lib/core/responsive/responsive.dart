import 'package:flutter/material.dart';

class Responsive {
  static late MediaQueryData _mediaQuery;

  static late double screenWidth;
  static late double screenHeight;

  static late double scaleWidth;
  static late double scaleHeight;
  static late double scaleText;

  // Base UI size (your design size)
  static const double baseWidth = 375;
  static const double baseHeight = 812;

  static void init(BuildContext context) {
    _mediaQuery = MediaQuery.of(context);

    screenWidth = _mediaQuery.size.width;
    screenHeight = _mediaQuery.size.height;

    scaleWidth = screenWidth / baseWidth;
    scaleHeight = screenHeight / baseHeight;

    scaleText = scaleWidth;
  }
}
