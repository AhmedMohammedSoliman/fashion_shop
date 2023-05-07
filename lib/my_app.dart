import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/categories/categories_screen.dart';
import 'package:my_app/config/app_theme.dart';
import 'package:my_app/favourite/favourite_screen.dart';
import 'package:my_app/login/login_screen.dart';
import 'package:my_app/prefs/shared_prefs.dart';
import 'package:my_app/profile/profile_screen.dart';
import 'package:my_app/register/register_screen.dart';
import 'package:my_app/splash/splash_screen.dart';
import 'card/card_screen.dart';
import 'core/app_routes.dart';
import 'major/major_screen.dart';

class MyApp extends StatelessWidget {
 static String? token ;
 static String? getUserToken(){
    token = (Cache.getTokenInCache(key: "token"))!;
    return token ;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: getUserToken() != null ? AppRoutes.homeRoute : AppRoutes.registerRoute,
      routes: {
        AppRoutes.splashRoute : (context) => SplashScreen(),
        AppRoutes.homeRoute : (context) => MajorScreen(),
        AppRoutes.loginRoute : (context) => LoginScreen(),
        AppRoutes.registerRoute : (context) => RegisterScreen(),
        AppRoutes.profileRoute : (context) => ProfileScreen(),
        AppRoutes.categoriesRoute : (context) => CategoriesScreen(),
        AppRoutes.cardRoute : (context) => CardScreen(),
        AppRoutes.favouriteRoute: (context) => FavouriteScreen(),
      },
      locale: Locale ("en"),
      theme: AppTheme.lightTheme,
    );
  }
}