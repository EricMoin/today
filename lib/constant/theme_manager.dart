import 'package:flutter/material.dart';
import 'package:tiny_weather/constant/theme.dart';
import 'package:tiny_weather/constant/util.dart';

class ThemeManager {
  ThemeManager._();
  static ThemeData light(BuildContext context) => ZTheme(createTextTheme(context, 'Manrope', 'Manrope')).light();
  static ThemeData dark(BuildContext context) => ZTheme(createTextTheme(context, 'Manrope', 'Manrope')).dark();
}