import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/card/card_screen.dart';
import 'package:my_app/categories/categories_screen.dart';
import 'package:my_app/core/app_routes.dart';
import 'package:my_app/favourite/favourite_screen.dart';
import 'package:my_app/home/home_screen.dart';
import 'package:my_app/profile/profile_screen.dart';

class MajorScreen extends StatefulWidget {

  static const String routeName = AppRoutes.majorRoute;
  @override
  State<MajorScreen> createState() => _MajorScreenState();
}

class _MajorScreenState extends State<MajorScreen> {
  int selectedIndex = 0 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar (
        currentIndex: selectedIndex,
        onTap: (index){
          selectedIndex = index ;
          setState(() {
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon (Icons.home) , label: "home"),
          BottomNavigationBarItem(icon: Icon (Icons.category) , label: "categories"),
          BottomNavigationBarItem(icon: Icon (Icons.favorite) , label: "favourite"),
          BottomNavigationBarItem(icon: Icon (Icons.shopping_cart) , label: "card"),
          BottomNavigationBarItem(icon: Icon (Icons.person) , label: "profile"),
        ],

      ),
      body: listItems[selectedIndex],
    );
  }

  List <Widget> listItems = [HomeScreen() , CategoriesScreen() , FavouriteScreen() ,
  CardScreen() , ProfileScreen()] ;
}