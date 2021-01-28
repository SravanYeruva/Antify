import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Register extends StatefulWidget {
  const Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    var s = 2;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            animation(s),
            Row(
              children: [
                Container(
                  width: 300,
                  child: Card(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Email',
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget animation(s) {
    print("got s as $s");
    if (s == 1) {
      return Container(
        height: 200,
        width: 100,
        child: Lottie.asset('lib/assets/animations/invalid-email-id.json'),
      );
    }
    if (s == 0) {
      return Container(
        color: Colors.red,
        height: 200,
        width: 100,
        child: Lottie.asset('lib/assets/animations/valid_email.json'),
      );
    } else {
      return Container(
        
        alignment: Alignment.center,
        height: 200,
        width: 300,
        child: TypewriterAnimatedTextKit(
          text: ['Please Enter Gmail Id'],
          speed: Duration(milliseconds: 100),
          textStyle: TextStyle(
              fontSize: 25.0, fontFamily: "Agne", color: Colors.black),
              
        ),
      );
    }
  }
}
