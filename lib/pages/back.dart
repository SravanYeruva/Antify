import 'package:cloud_firestore/cloud_firestore.dart';

class Senddata {
  FirebaseFirestore obj = FirebaseFirestore.instance;
  List arr = [1, 2, 4, 5];
  senddat(String user, String desig,String head, String desc,
      String req) async {
    await obj.collection('costs').doc().set(
        {"user": user, "desig": desig, "time": FieldValue.serverTimestamp(), "desc": desc, "req": req,"head":head});
    print('hola');
    print(FieldValue.serverTimestamp());
  }
}
