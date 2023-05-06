import 'package:flutter/material.dart';
import 'package:my_app/core/app_colors.dart';

class AppTheme {

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.lightPrimaryColor ,
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: Color(0xffa67c00) , fontSize: 20 , fontWeight: FontWeight.bold) ,
    )
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.darkPrimaryColor ,
  );
}