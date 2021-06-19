import 'package:esportzzz/MatchRow.dart';
import 'package:esportzzz/appbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: new Color.fromARGB(255, 62, 58, 99),
      body: new HomePageBody(),
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
        new MatchRow(),
      ],
    );
  }
}
