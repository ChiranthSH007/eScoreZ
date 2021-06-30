import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esportzzz/appbar.dart';
import 'package:esportzzz/newstile.dart';
import 'package:esportzzz/operations.dart';
import 'package:flutter/material.dart';

import 'newsdetailpage.dart';

class NewsHome extends StatefulWidget {
  @override
  _NewsHomeState createState() => _NewsHomeState();
}

class _NewsHomeState extends State<NewsHome> {
  //final Stream<QuerySnapshot> newstream =

  // @override
  // void initState() {
  //   super.initState();
  // }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: Colors.black,
        body: SafeArea(
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('newsdetails')
                  .snapshots(includeMetadataChanges: true),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data() as Map<String, dynamic>;
                    return new NewsTile(
                      title: data['title'],
                      description: data['description'],
                      imgurl: data['imgurl'],
                    );
                  }).toList(),
                );
              }),
        ));
  }
}