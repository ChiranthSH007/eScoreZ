import 'package:esportzzz/MatchRow.dart';
import 'package:esportzzz/appbar.dart';
import 'package:esportzzz/newshomepage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedindex = 0;
  List<Widget> _pages = [
    HomePageBody(),
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

class HomePageBody extends StatefulWidget {
  @override
  _HomePageBodyState createState() => new _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new GradientAppBar("eSportzzz"),
        new MatchRow(),
        new MatchRow(),
        new MatchRow(),
      ],
    );
  }
}
