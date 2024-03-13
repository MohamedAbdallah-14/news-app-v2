import 'package:flutter/material.dart';
import 'package:news_app/core/helpers/app_colors.dart';
import 'package:news_app/core/theme/main_text_theme.dart';

class MainThemes {
  static final ThemeData mainLightTheme = ThemeData(
    primaryColor: AppColors.mossyGreen,
    highlightColor: Colors.transparent,
    scaffoldBackgroundColor: Colors.white,
    textTheme: MainTextTheme.textTheme,
  );
}
