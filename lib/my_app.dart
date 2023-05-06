import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/config/app_theme.dart';
import 'package:my_app/home/home_screen.dart';
import 'package:my_app/login/login_screen.dart';
import 'package:my_app/register/register_screen.dart';
import 'package:my_app/splash/splash_screen.dart';
import 'core/app_routes.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splashRoute,
      routes: {
        AppRoutes.splashRoute : (context) => SplashScreen(),
        AppRoutes.homeRoute : (context) => HomeScreen(),
        AppRoutes.loginRoute : (context) => LoginScreen(),
        AppRoutes.registerRoute : (context) => RegisterScreen(),
      },
      locale: Locale ("en"),
      theme: AppTheme.lightTheme,
    );
  }
}