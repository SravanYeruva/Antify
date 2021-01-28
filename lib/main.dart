import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:antify/pages/home.dart';
import 'package:antify/pages/search.dart';
// import 'package:antify/pages/post.dart';
// import 'package:antify/pages/register.dart';
// //import 'package:antify/pages/test.dart';
// //import 'package:antify/pages/register.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Antify',
        home: AnimatedSplashScreen(
            duration: 3000,
            splash: Container(
              child: Container(
                child: Column(
                  children: [
                    ColorizeAnimatedTextKit(
                      text: ['Get', 'Set', 'Antify'],
                      textStyle: TextStyle(fontSize: 50.0, fontFamily: "abnes"),
                      colors: [
                        Colors.purple,
                        Colors.blue,
                        Colors.yellow,
                        Colors.red,
                      ],
                    ),
                  ],
                ),
              ),
            ),
            nextScreen:Search(),
            splashTransition: SplashTransition.fadeTransition,
            pageTransitionType: PageTransitionType.scale,
            backgroundColor: Colors.white));
  }
}
