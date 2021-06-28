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
  final Stream<QuerySnapshot> newstream = FirebaseFirestore.instance
      .collection('newsdetails')
      .snapshots(includeMetadataChanges: true);

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: StreamBuilder(
              stream: newstream,
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                return ListView(
                  children: snapshot.data!.docs.map((grocery) {
                    return NewsTile(
                      title: grocery['title'],
                    );
                  }).toList(),
                );
              }),
        ));
  }
}
