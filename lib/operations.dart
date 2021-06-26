import 'package:cloud_firestore/cloud_firestore.dart';

class Operations {
  newstilegetdata() async {
    return await Firestore.instance.collection("news").snapshots();
  }
}
