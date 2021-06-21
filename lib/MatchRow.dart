import 'package:esportzzz/matchdetailpage.dart';
import 'package:flutter/material.dart';

class MatchRow extends StatelessWidget {
  final bool horizontal;
  MatchRow({this.horizontal = true});
  MatchRow.vertical() : horizontal = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //
    final matchCardContent = new Container(
      margin: new EdgeInsets.fromLTRB(
          horizontal ? size.width * 0.23 : size.width * 0.03,
          horizontal ? size.height * 0.01 : size.height * 0.04,
          size.width * 0.01,
          size.height * 0.005),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment:
            horizontal ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: <Widget>[
          new Container(height: size.height * 0.002),
          new Text(
            "Valorant",
            style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: size.width * 0.04,
                fontWeight: FontWeight.w600),
          ),
          new Container(height: size.height * 0.005),
          new Text(
            "Match",
            style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: size.width * 0.03,
                fontWeight: FontWeight.w600),
          ),
          new Container(
              margin: new EdgeInsets.symmetric(vertical: size.height * 0.008),
              height: size.height * 0.003,
              width: size.width * 0.05,
              color: new Color(0xff00c6ff)),
          new Row(
            children: <Widget>[
              new Container(width: size.width * 0.08),
              new Text(
                "12",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Color(0xffb6b2df),
                    fontSize: size.width * 0.029,
                    fontWeight: FontWeight.w400),
              ),
              new Container(width: size.width * 0.080),
              new Container(width: size.width * 0.012),
              new Text(
                "10",
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

      height: horizontal ? 124.0 : 154,
      margin: horizontal
          ? new EdgeInsets.only(left: 46.0)
          : new EdgeInsets.only(top: 1.0),
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
    return new GestureDetector(
        onTap: horizontal
            ? () => Navigator.of(context).push(
                  new PageRouteBuilder(
                    pageBuilder: (_, __, ___) => new DetailPage(),
                    transitionsBuilder: (context, animation, secondaryAnimation,
                            child) =>
                        new FadeTransition(opacity: animation, child: child),
                  ),
                )
            : null,
        child: new Container(
          margin: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 20.0,
          ),
          child: new Stack(
            children: <Widget>[
              matchCard,
              matchThumbnailLeft,
              matchThumbnailRight,
            ],
          ),
        ));
  }
}
