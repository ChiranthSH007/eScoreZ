import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esportzzz/News_pages/newstile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Main_Pages/navbar.dart';
import 'newsdetailpage.dart';

class NewsHome extends StatefulWidget {
  @override
  _NewsHomeState createState() => _NewsHomeState();
}

class _NewsHomeState extends State<NewsHome> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String _uid;
  _checkUserStatus() async {
    final User? user = _auth.currentUser;
    setState(() {
      _uid = user!.uid;
    });
  }

  @override
  void initState() {
    _checkUserStatus();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Image.asset(
                "lib/assets/img/editedlogo.png",
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.13,
              ),
              Text(
                "eScoreZ",
                style: GoogleFonts.rowdies(fontSize: 25),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.16,
              ),
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.tealAccent),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  iconSize: 30,
                ),
              )
            ],
          ),

          backgroundColor: Color(0xff1f1a30),
          shadowColor: Color(0xff1f1a30),

          // elevation: 15,
          // shadowColor: Colors.grey[200],
        ),
        backgroundColor: Color(0xff1f1a30),
        body: SafeArea(
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('newsdetails')
                  .snapshots(includeMetadataChanges: true),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.tealAccent,
                    ),
                  );
                }
                return ListView(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data() as Map<String, dynamic>;
                    return Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: new NewsTile(
                          title: data['title'],
                          description: data['description'],
                          imgurl: data['imgurl'],
                          uid: _uid,
                          docid: document.id),
                    );
                  }).toList(),
                );
              }),
        ));
  }
}
