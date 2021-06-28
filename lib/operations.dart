import 'package:cloud_firestore/cloud_firestore.dart';

class Operations {
  newstilegetdata() async {
<<<<<<< HEAD
    return await FirebaseFirestore.instance.collection("news").snapshots();
=======
    return FirebaseFirestore.instance.collection("news").snapshots();
>>>>>>> a70331ba97f64df7f7d9d4951bc7a6320961b3f1
  }
}
