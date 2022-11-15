import 'package:flutter/material.dart';
import 'package:flutter_study_case/core/theme/colors.dart';
import 'package:flutter_study_case/core/theme/theme_color.dart';

ThemeData themeData() {
  return ThemeData(
      fontFamily: "Regular",
      colorScheme: colorTheme(),
      scaffoldBackgroundColor: ThemeColors().scaffoldBackgroundThemeColor);
}
