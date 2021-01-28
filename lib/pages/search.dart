import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  final contro = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Container(
        child: Column(
          children: [
            Text('data'),
            Container(
              // width: 100,
              child: TextField(
                controller: contro,
                decoration: InputDecoration(hintText: 'hola'),
                onChanged: (String query) {
                  listos(query);
                  print('done search');
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  listos(String query) async {
    var dlist;
    // String query = 'hell';
    List hello = query.split(',');
    print(hello);
    dlist = await FirebaseFirestore.instance
        .collection('posts')
        .where("desig", isEqualTo: query)
        .get()
        .then((value) {
      var he = value.docs.toList();
      for (var i = 0; i < he.length; i++) {
        print(he.length);
        print('${he[i].data()}');
      }
    });
  }
}
