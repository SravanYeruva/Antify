import 'package:antify/pages/back.dart';
import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  final contro = TextEditingController();
  final contro1 = TextEditingController();
  final contro2 = TextEditingController();
  final contro3 = TextEditingController();
  final contro4 = TextEditingController();
  final contro5 = TextEditingController();
  Senddata hey = Senddata();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ps")),
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: contro,
              decoration: InputDecoration(hintText: 'User'),
            ),
            TextField(
              controller: contro1,
              decoration: InputDecoration(hintText: 'desig'),
            ),
            TextField(
              controller: contro3,
              decoration: InputDecoration(hintText: 'Head'),
            ),
            TextField(
              controller: contro4,
              decoration: InputDecoration(hintText: 'desc'),
            ),
            TextField(
              controller: contro5,
              decoration: InputDecoration(hintText: 'req'),
            ),
            RaisedButton(onPressed: () {
              for (int i = 0; i < 10; i++) {
                hey.senddat(contro.text, contro1.text, contro3.text,
                    contro4.text, contro5.text);
              }
            })
          ],
        ),
      ),
    );
  }
}
