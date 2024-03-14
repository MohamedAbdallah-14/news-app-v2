import 'package:flutter/material.dart';
import 'package:news_app/core/helpers/app_colors.dart';

class MainTextTheme {
  static const TextTheme textTheme = TextTheme(
    displayLarge: TextStyle(
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      fontSize: 32,
      color: AppColors.white,
      height: 40 / 32,
    ),
    displayMedium: TextStyle(
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      fontSize: 28,
      color: AppColors.white,
      height: 38 / 28,
    ),
    displaySmall: TextStyle(
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      fontSize: 22,
      color: AppColors.white,
      height: 28 / 22,
    ),
    headlineMedium: TextStyle(
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      fontSize: 20,
      color: AppColors.white,
      height: 26 / 20,
    ),
    headlineSmall: TextStyle(
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      fontSize: 18,
      color: AppColors.white,
      height: 22 / 18,
    ),
    titleLarge: TextStyle(
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      fontSize: 16,
      color: AppColors.white,
      height: 21 / 16,
    ),
    //Button Medium - 16px
    titleMedium: TextStyle(
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 16,
      color: AppColors.white,
      height: 21 / 16,
    ),
    //Body Text C (Bold) - 12px
    titleSmall: TextStyle(
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      fontSize: 12,
      color: AppColors.white,
      height: 16 / 12,
    ),
    //Body Text A - 16px
    bodyLarge: TextStyle(
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 16,
      color: AppColors.white,
      height: 21 / 16,
    ),
    //Body/Text B
    bodyMedium: TextStyle(
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 15,
      color: AppColors.white,
      height: 20 / 15,
    ),
    bodySmall: TextStyle(
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 12,
      color: AppColors.white,
      height: 16 / 12,
    ),
    labelLarge: TextStyle(
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      fontSize: 18,
      color: AppColors.white,
      height: 24 / 18,
    ),
  );
}
