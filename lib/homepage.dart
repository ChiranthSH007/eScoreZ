import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esportzzz/MatchRow.dart';
import 'package:esportzzz/appbar.dart';
import 'package:esportzzz/newshomepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedindex = 0;
  List<Widget> _pages = [
    MatchesHomePage(),
    NewsHome(),
  ];
  void _ontapped(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      body: _pages[_selectedindex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey.shade900,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feed),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        selectedLabelStyle: TextStyle(fontSize: 13),
        currentIndex: _selectedindex,
        unselectedItemColor: Colors.white,
        onTap: _ontapped,
      ),
    );
  }
}

class MatchesHomePage extends StatefulWidget {
  @override
  _MatchesHomePageState createState() => new _MatchesHomePageState();
}

class _MatchesHomePageState extends State<MatchesHomePage> {
  late Stream matchStream;

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(),
      body: SafeArea(
          child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('allmatchdetails')
            .snapshots(includeMetadataChanges: true),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return new ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              if (document == null) {
                return CircularProgressIndicator();
              }
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              return new MatchRow(
                date: data['date'],
                livescoret1: data['livescore1'].toString(),
                livescoret2: data['livescore2'].toString(),
                logo1url: data['logo1url'],
                logo2url: data['logo2url'],
                teamname1: data['teamname1'],
                teamname2: data['teamname2'],
              );
            }).toList(),
          );
        },
      )),
    );
  }
}
