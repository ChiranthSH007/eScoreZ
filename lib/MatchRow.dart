import 'package:flutter/material.dart';

class MatchRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final matchCardContent = new Container(
      margin: new EdgeInsets.fromLTRB(size.width * 0.25, size.height * 0.008,
          size.width * 0.25, size.height * 0.008),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(height: size.height * 0.002),
          new Text(
            "Valorant",
            style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: size.width * 0.060,
                fontWeight: FontWeight.w600),
          ),
          new Container(height: size.height * 0.009),
          new Text(
            "Match",
            style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: size.width * 0.045,
                fontWeight: FontWeight.w600),
          ),
          new Container(
              margin: new EdgeInsets.symmetric(vertical: size.height * 0.012),
              height: size.height * 0.004,
              width: size.width * 0.055,
              color: new Color(0xff00c6ff)),
          new Row(
            children: <Widget>[
              new Container(width: size.width * 0.008),
              new Text(
                "12 Points",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Color(0xffb6b2df),
                    fontSize: size.width * 0.029,
                    fontWeight: FontWeight.w400),
              ),
              new Container(width: size.width * 0.080),
              new Container(width: size.width * 0.012),
              new Text(
                "10 Points",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Color(0xffb6b2df),
                    fontSize: size.width * 0.029,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ],
      ),
    );

    final matchThumbnailLeft = new Container(
      margin:
          new EdgeInsets.only(left: size.width * 0.0, top: size.height * 0.023),
      alignment: FractionalOffset(0.0, 0.0),
      child: new Image(
        image: new AssetImage("lib/assets/img/mars.png"),
        height: size.height * 0.12,
        width: size.width * 0.24,
      ),
    );

    final matchThumbnailRight = new Container(
      margin: new EdgeInsets.only(
          right: size.width * 0.055, top: size.height * 0.024),
      alignment: FractionalOffset(1.1, 0),
      child: new Image(
        image: new AssetImage("lib/assets/img/mars.png"),
        height: size.height * 0.12,
        width: size.width * 0.24,
      ),
    );

    final matchCard = new Container(
      child: matchCardContent,
      height: size.height * 0.18,
      margin: new EdgeInsets.only(
          left: size.width * 0.045, right: size.width * 0.035),
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
        margin: const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
        child: new Stack(
          children: <Widget>[
            matchCard,
            matchThumbnailLeft,
            matchThumbnailRight
          ],
        ));
  }
}
