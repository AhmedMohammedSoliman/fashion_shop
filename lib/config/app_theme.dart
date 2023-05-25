import 'package:flutter/material.dart';
import 'package:my_app/core/app_colors.dart';

class AppTheme {

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.lightPrimaryColor ,
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: Color(0xffa67c00) , fontSize: 20 , fontWeight: FontWeight.bold) ,
      bodyMedium: TextStyle(color: Colors.green , fontSize: 18 , fontWeight: FontWeight.w500)
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.blue ,
      unselectedItemColor: Colors.black
    ) ,
    appBarTheme: AppBarTheme(
      elevation: 0 ,
      backgroundColor: Colors.yellowAccent ,

    )
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.darkPrimaryColor ,
  );
}