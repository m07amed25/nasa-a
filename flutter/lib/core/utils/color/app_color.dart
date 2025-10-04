import 'dart:ui';

import 'package:flutter/material.dart';

class AppColor {
  static const fillColor = Color(0xFF0E1621);
  static const mainColor = Color(0xFF483999);
  static const secondColor = Color(0xFF7087C3);
  static const textColor = Colors.white;
  static const errorColor = Colors.red;
  static const greyColor = Colors.grey;

  static const Gradient linearColor = LinearGradient(
    colors: [mainColor, secondColor],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
