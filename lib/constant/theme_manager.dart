import 'package:flutter/material.dart';
import 'package:today/constant/theme.dart';
import 'package:today/constant/util.dart';

class ThemeManager {
  ThemeManager._();
  static ThemeData light(BuildContext context) => ZTheme(createTextTheme(context, 'Manrope', 'Manrope')).light();
  static ThemeData dark(BuildContext context) => ZTheme(createTextTheme(context, 'Manrope', 'Manrope')).dark();
}