import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final String index;
  Profile({Key key, this.index}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 18.0),
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
          )
        ],
        centerTitle: true,
        title: ColorizeAnimatedTextKit(
          text: ['Antify'],
          textStyle: TextStyle(fontSize: 25.0, fontFamily: "abnes"),
          colors: [
            Colors.purple,
            Colors.blue,
            Colors.yellow,
            Colors.red,
          ],
          // isRepeatingAnimation: true,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(
              Icons.last_page,
              color: Colors.black,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text('you came to profile page with index ${widget.index}'),
      ),
    );
  }
}
