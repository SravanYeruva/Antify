import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:antify/pages/back.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List hola = [
    'Mugunthan Raju',
    'Tharun',
    'Renusri',
    'Sravan Yeruva',
    'Tejaswini J',
    'Vijay',
    'Hari S',
    'Himaja Redyy',
    'Vamsidhar',
    'YuvaSri'
  ];
  List headings = [
    'Twitter Clone using Django',
    'Whatsapp data hacking software',
    'Web version of antify',
    'A Collaboration App Using Flutter',
    'Make Recommendation Software using Ml',
    'Student Monitoring Software using C++',
    'AI and ML model in OpenCV',
    'Pubic Poll App using Android',
    'B2B Software for a Client',
    'Voice Changing Software'
  ];
  List stat = [0, 0, 0, 0, 1, 1, 0, 0, 1, 0];
  var swi = 0;
  Senddata onf = Senddata();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 18.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  print('called state');
                });
              },
              child: Icon(
                Icons.search,
                color: Colors.black,
              ),
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
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                Navigator.pop(context);
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('posts')
              .orderBy('time', descending: false)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            print("vamsi");
            return ListView.builder(
              itemCount: (snapshot.hasData == false) ? 10 : snapshot.data.size,
              itemBuilder: (context, index) {
                if (!snapshot.hasData) {
                  return Center(
                    child: Card(
                      child: Lottie.asset('lib/assets/animations/lott.json'),
                    ),
                  );
                }
                return Card(
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100)),
                                      border: Border.all(
                                          width: 3,
                                          color: Colors.white,
                                          style: BorderStyle.solid)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Image.asset(
                                        'lib/assets/images/profile/$index.png'),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 4.0),
                              child: Container(
                                constraints: BoxConstraints(maxWidth: 120),
                                child: Text(
                                  snapshot.data.docs[index]['user'],
                                  maxLines: 1,
                                  overflow: TextOverflow.fade,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Stutea(
                              into: stat,
                              indo: index,
                            ),
                            Expanded(
                              child: Container(
                                color: Colors.blue,
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              child: Text('5m ago'),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  snapshot.data.docs[index]['head'],
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      fontFamily: "JustDream"),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  snapshot.data.docs[index]['desc'],
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.grey[600],
                                      fontFamily: 'Monstreat',
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Row(
                            children: [
                              Reqs(req: 'Andorid'),
                              Reqs(req: 'React-Native'),
                              Reqs(req: 'Django'),
                              Reqs(req: 'Kali-Linux'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}

class Stutea extends StatelessWidget {
  Stutea({Key key, this.into, this.indo}) : super(key: key);
  final List into;
  final int indo;

  @override
  Widget build(BuildContext context) {
    return (into[indo] == 0)
        ? Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Text(
                'Student',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                ),
              ),
            ),
            decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.centerLeft, colors: [
                  Colors.purple,
                  Colors.blue,
                ], stops: [
                  0.0,
                  0.7
                ]),
                borderRadius: BorderRadius.all(Radius.circular(10))),
          )
        : Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Text(
                'Professor',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                ),
              ),
            ),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  colors: [
                    Colors.red,
                    Colors.orange[600],
                  ],
                  stops: [0.0, 0.7],
                ),
                borderRadius: BorderRadius.all(Radius.circular(10))),
          );
  }
}

class Reqs extends StatelessWidget {
  const Reqs({Key key, this.req}) : super(key: key);
  final String req;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Container(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 8.0, right: 8.0, top: 2, bottom: 2.0),
          child: Text(
            req,
            style: TextStyle(fontSize: 12),
          ),
        ),
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }
}
