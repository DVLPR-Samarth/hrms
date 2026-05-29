import 'package:flutter/material.dart';
import 'responsive.dart';

extension ResponsiveExtension on num {
  double get w => this * Responsive.scaleWidth;

  double get h => this * Responsive.scaleHeight;

  double get sp => this * Responsive.scaleText;

  SizedBox get verticalSpace => SizedBox(height: h);

  SizedBox get horizontalSpace => SizedBox(width: w);
}
