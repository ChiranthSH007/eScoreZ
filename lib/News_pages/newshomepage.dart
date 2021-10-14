import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esportzzz/Main_Pages/profile_page.dart';
import 'package:esportzzz/News_pages/newstile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paginate_firestore/paginate_firestore.dart';

class NewsHome extends StatefulWidget {
  @override
  _NewsHomeState createState() => _NewsHomeState();
}

class _NewsHomeState extends State<NewsHome> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  ScrollController controller = ScrollController();
  late String _uid;
  _checkUserStatus() async {
    final User? user = _auth.currentUser;
    setState(() {
      _uid = user!.uid;
    });
  }

  @override
  void initState() {
    super.initState();
    _checkUserStatus();
  }

  Widget safeArea() {
    return SafeArea(
      child: PaginateFirestore(
        itemBuilderType: PaginateBuilderType.listView,
        itemBuilder: (index, context, documentSnapshot) {
          final data = documentSnapshot.data() as Map?;
          return Padding(
            padding: const EdgeInsets.only(top: 12),
            child: new NewsTile(
              title: data!['title'],
              description: data['description'],
              imgurl: data['imgurl'],
              uid: _uid,
              docid: documentSnapshot.id,
              date: data['date'],
              gamename: data['game_name'],
              source: data['source'],
            ),
          );
        },
        query: FirebaseFirestore.instance.collection('newsdetails'),
        isLive: true,
        itemsPerPage: 4,
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
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
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => Profile_Page(),
                        ));
                  },
                  icon: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  iconSize: 30,
                ),
              )
            ],
          ),
<<<<<<< HEAD

          
=======
          backgroundColor: Color(0xff1f1a30),
>>>>>>> 9cf855599b37cb54cb8e31bb4909414981e06a1a
          shadowColor: Color(0xff1f1a30),
        ),
        backgroundColor: Color(0xff1f1a30),
        body: safeArea());
  }
}

//Basic Build Model With List View 


// StreamBuilder(
//               stream: FirebaseFirestore.instance
//                   .collection('newsdetails')
//                   .snapshots(includeMetadataChanges: true),
//               builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//                 if (!snapshot.hasData) {
//                   return Center(
//                     child: CircularProgressIndicator(
//                       color: Colors.tealAccent,
//                     ),
//                   );
//                 }
//                 return ListView(
//                   children:
//                       snapshot.data!.docs.map((DocumentSnapshot document) {
//                     Map<String, dynamic> data =
//                         document.data() as Map<String, dynamic>;
//                     return Padding(
//                       padding: const EdgeInsets.only(top: 12),
//                       child: new NewsTile(
//                           title: data['title'],
//                           description: data['description'],
//                           imgurl: data['imgurl'],
//                           uid: _uid,
//                           docid: document.id),
//                     );
//                   }).toList(),
//                 );
//               }),