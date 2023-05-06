import 'package:flutter/material.dart';
import 'package:my_app/core/app_colors.dart';

class AppTheme {

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.lightPrimaryColor ,
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.darkPrimaryColor ,
  );
}