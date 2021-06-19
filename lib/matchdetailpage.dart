import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        constraints: new BoxConstraints.expand(),
        color: new Color.fromARGB(255, 62, 58, 99),
        child: new Stack(
          children: [
            _getBackground(),
            _getGradient(),
            _getContent(),
          ],
        ),
      ),
    );
  }

  Container _getBackground() {
    return new Container(
      child: Image(
        image: new AssetImage("lib/assets/img/valorant.jpg"),
        height: 400.0,
        fit: BoxFit.cover,
      ),
      constraints: new BoxConstraints.expand(height: 400.0),
      // child: new Image.network(
      //   "lib/assets/img/valorant.png",
      //   fit: BoxFit.cover,
      //   height: 300.0,
      // ),
    );
  }

  Container _getGradient() {
    return new Container(
      margin: new EdgeInsets.only(top: 220.0),
      height: 180.0,
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: <Color>[
            new Color(0x00736AB7),
            new Color.fromARGB(255, 62, 58, 99),
          ],
          stops: [0.0, 0.8],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.0, 1.3),
        ),
      ),
    );
  }

  Widget _getContent() {
    return new ListView(
      padding: new EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),
      children: <Widget>[],
    );
  }
}
