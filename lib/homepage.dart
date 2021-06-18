import 'package:esportzzz/HomePageBody.dart';
import 'package:esportzzz/appbar.dart';
import 'package:flutter/material.dart';

class homepage extends StatelessWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Column(
      children: <Widget>[
        new GradientAppBar("eSportzzz"),
        new HomePageBody(),
      ],
    ));
  }
}
