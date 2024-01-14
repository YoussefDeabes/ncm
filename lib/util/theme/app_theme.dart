import 'package:flutter/material.dart';
import 'package:ncm/res/const_colors.dart';

class AppTheme {
  final Locale locale;

  const AppTheme(this.locale);

  ThemeData get themeDataLight {
    return ThemeData(
        primarySwatch: ConstColors.primarySwatch,
        fontFamily: "AdelleSans",
        useMaterial3: false,
        scaffoldBackgroundColor: ConstColors.scaffoldBackground);
  }
}
