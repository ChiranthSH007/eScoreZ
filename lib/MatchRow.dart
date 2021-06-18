import 'package:flutter/material.dart';

class MatchRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final matchCardContent = new Container(
      margin: new EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(height: 4.0),
          new Text(
            "Valorant",
            style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
          new Container(height: 10.0),
          new Text(
            "Match",
            style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600),
          ),
          new Container(
              margin: new EdgeInsets.symmetric(vertical: 8.0),
              height: 2.0,
              width: 18.0,
              color: new Color(0xff00c6ff)),
          new Row(
            children: <Widget>[
              new Container(width: 8.0),
              new Text(
                "12 Points",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Color(0xffb6b2df),
                    fontSize: 9,
                    fontWeight: FontWeight.w400),
              ),
              new Container(width: 24.0),
              new Container(width: 8.0),
              new Text(
                "10 Points",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Color(0xffb6b2df),
                    fontSize: 9,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ],
      ),
    );

    final matchThumbnail = new Container(
      margin: new EdgeInsets.symmetric(vertical: 16.0),
      alignment: FractionalOffset.centerLeft,
      child: new Image(
        image: new AssetImage("lib/assets/img/mars.png"),
        height: 92.0,
        width: 92.0,
      ),
    );

    final matchCard = new Container(
      child: matchCardContent,
      height: 124.0,
      margin: new EdgeInsets.only(left: 46.0),
      decoration: new BoxDecoration(
        color: new Color(0xFF333366),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: new Offset(0.0, 10.0),
          ),
        ],
      ),
    );
    return new Container(
        margin: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: new Stack(
          children: <Widget>[matchCard, matchThumbnail],
        ));
  }
}
