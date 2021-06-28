import 'package:cloud_firestore/cloud_firestore.dart';

class Operations {
  newstilegetdata() async {
    return FirebaseFirestore.instance.collection("news").snapshots();
  }
}
