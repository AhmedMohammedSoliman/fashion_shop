import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:my_app/home/home_screen.dart';
import 'package:my_app/register/register_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Stack(
            alignment: Alignment.bottomCenter,
              children: [
            Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
              image: AssetImage("assets/images/logo.png"),
              fit: BoxFit.fill,
            ))),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(width: 20.0, height: 100.0),
                const Text(
                  'Be',
                  style: TextStyle(fontSize: 43.0),
                ),
                const SizedBox(width: 20.0, height: 100.0),
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 40.0,
                    fontFamily: 'Horizon',
                    color: Colors.black
                  ),
                  child: AnimatedTextKit(
                    isRepeatingAnimation: false,
                    onFinished: (){
                      Navigator.pushReplacementNamed(context, RegisterScreen.routeName);
                    },
                    animatedTexts: [
                      RotateAnimatedText('AWESOME'),
                      RotateAnimatedText('OPTIMISTIC'),
                      RotateAnimatedText('Fashion'),
                    ],
                    onTap: () {
                      print("Tap Event");
                    },
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
