import 'package:flutter/material.dart';
import 'package:newsapp/Core/utils/app_colors.dart';

ThemeData lightmode = ThemeData(
  scaffoldBackgroundColor: AppColors.primaryColor,
  brightness: Brightness.light,
  fontFamily: 'Montserrat',
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primaryColor,
    // Ensure brightness matches ThemeData.brightness
  ),
);

ThemeData darkmode = ThemeData(
  brightness: Brightness.dark,
  fontFamily: 'Montserrat',
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.secondaryColor,
    brightness:
        Brightness.dark, // Ensure brightness matches ThemeData.brightness
  ),
);
