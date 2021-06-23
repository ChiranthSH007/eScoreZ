import 'package:esportzzz/MatchRow.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        constraints: new BoxConstraints.expand(),
        color: Colors.black,
        child: new Stack(
          children: [
            _getBackground(),
            //_getGradient(),
            _getContent(),
            _getToolbar(context),
          ],
        ),
      ),
    );
  }

  Container _getBackground() {
    return new Container(
      child: Image(
        image: new AssetImage("lib/assets/img/valorant.jpg"),
        height: 300.0,
        fit: BoxFit.cover,
      ),
      constraints: new BoxConstraints.expand(height: 300.0),
      // child: new Image.network(
      //   "lib/assets/img/valorant.png",
      //   fit: BoxFit.cover,
      //   height: 300.0,
      // ),
    );
  }

  // Container _getGradient() {
  //   return new Container(
  //     margin: new EdgeInsets.only(top: 220.0),
  //     height: 180.0,
  //     decoration: new BoxDecoration(
  //       gradient: new LinearGradient(
  //         colors: <Color>[
  //           new Color(0x00736AB7),
  //           new Color.fromARGB(255, 62, 58, 99),
  //         ],
  //         stops: [0.0, 0.8],
  //         begin: const FractionalOffset(0.0, 0.0),
  //         end: const FractionalOffset(0.0, 1.3),
  //       ),
  //     ),
  //   );
  // }

  Widget _getContent() {
    return new Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 210, 12, 0),
              child: MatchRow(
                horizontal: false,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.live_tv,
                        color: Colors.white,
                      )),
                ),
                Container(
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.info,
                        color: Colors.white,
                      )),
                ),
                Container(
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.trending_up,
                        color: Colors.white,
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Container _getToolbar(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: new BackButton(color: Colors.white),
    );
  }
}

class Separator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: new EdgeInsets.symmetric(vertical: 8.0),
        height: 2.0,
        width: 18.0,
        color: new Color(0xff00c6ff));
  }
}
