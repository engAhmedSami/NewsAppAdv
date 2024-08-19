import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/Core/utils/app_colors.dart';

ThemeData lightmode = ThemeData(
  textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
  scaffoldBackgroundColor: AppColors.primaryColor,
  brightness: Brightness.light,
  fontFamily: 'Montserrat',
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primaryColor,
    // Ensure brightness matches ThemeData.brightness
  ),
);

ThemeData darkmode = ThemeData(
  textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
  brightness: Brightness.dark,
  fontFamily: 'Montserrat',
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.secondaryColor,
    brightness:
        Brightness.dark, // Ensure brightness matches ThemeData.brightness
  ),
);
