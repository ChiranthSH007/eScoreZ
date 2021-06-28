import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esportzzz/appbar.dart';
import 'package:esportzzz/newstile.dart';
import 'package:esportzzz/operations.dart';
import 'package:flutter/material.dart';
import 'appbar.dart';

import 'newsdetailpage.dart';

class NewsHome extends StatefulWidget {
  @override
  _NewsHomeState createState() => _NewsHomeState();
}

class _NewsHomeState extends State<NewsHome> {
<<<<<<< HEAD
  final Stream<QuerySnapshot> newstream = FirebaseFirestore.instance
      .collection('newsdetails')
      .snapshots(includeMetadataChanges: true);

  @override
  void initState() {
    super.initState();
  }
=======
  //final Stream<QuerySnapshot> newstream =

  // @override
  // void initState() {
  //   super.initState();
  // }
>>>>>>> a70331ba97f64df7f7d9d4951bc7a6320961b3f1

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: StreamBuilder(
<<<<<<< HEAD
              stream: newstream,
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                return ListView(
                  children: snapshot.data!.docs.map((grocery) {
                    return NewsTile(
                      title: grocery['title'],
=======
              stream: FirebaseFirestore.instance
                  .collection('newsdet')
                  .snapshots(includeMetadataChanges: true),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                return ListView(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data() as Map<String, dynamic>;
                    return new NewsTile(
                      title: data['title'],
                      discription: data['description'],
                      imgurl: data['imgurl'],
>>>>>>> a70331ba97f64df7f7d9d4951bc7a6320961b3f1
                    );
                  }).toList(),
                );
              }),
        ));
  }
}
