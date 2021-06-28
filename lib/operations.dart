import 'package:cloud_firestore/cloud_firestore.dart';

class Operations {
  newstilegetdata() async {
    return await FirebaseFirestore.instance.collection("news").snapshots();
  }
}
