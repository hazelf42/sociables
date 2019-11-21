
import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  const AppColors();
  static const Color yellow = const Color(0xFFFFDC03);
  static const Color blue = const Color(0xFFBE7FF);
  static const Color green = const Color(0xFF5DFF6B);
  static const Color orange = const Color(0XFFFF7B0A);
  static const Color red = const Color(0XFFFF5714);
  static const colorList = [yellow, blue, green, orange, red];
}
class AppFonts { 
  static const whiteTitle = TextStyle(
    color: Colors.white,
    fontSize: 28
  );
  
  static const darkTitle = TextStyle(
    color: Colors.black87,
    fontSize: 27
  );
}