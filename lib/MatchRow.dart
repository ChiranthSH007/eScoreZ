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
<<<<<<< HEAD
          new Text(
            "Valorant",
            style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: size.width * 0.04,
                fontWeight: FontWeight.w600),
          ),
=======
          horizontal
              ? Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    new Text(
                      "Valorant",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.w600),
                    ),
                    new Text(
                      "Valorant",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                )
              : Container(
                  padding: EdgeInsets.all(size.width * 0.02),
                  child: Text(
                    "12 - 10",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: size.width * 0.05),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.grey.shade800,
                      border: Border.all(color: Colors.white, width: 2)),
                ),
>>>>>>> d7cd516ab06940d19f19c60a11b882e044aa02e0
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
<<<<<<< HEAD
          new Row(
            children: <Widget>[
              new Container(width: size.width * 0.08),
              new Text(
                "12",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Color(0xffb6b2df),
                    fontSize: size.width * 0.04,
                    fontWeight: FontWeight.w400),
              ),
              new Container(width: size.width * 0.017),
              new Container(width: size.width * 0.2),
              new Text(
                "10",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Color(0xffb6b2df),
                    fontSize: size.width * 0.04,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
=======
>>>>>>> d7cd516ab06940d19f19c60a11b882e044aa02e0
        ],
      ),
    );

    final matchThumbnailLeft = horizontal
        ? new Container(
            margin: new EdgeInsets.only(
                left: horizontal ? 0 : 10, top: horizontal ? 16 : 10),
            alignment: FractionalOffset(0.0, 0.0),
            child: ClipOval(
              child: Image(
                fit: BoxFit.cover,
                image: new AssetImage("lib/assets/img/sen-logo.png"),
                height: 92.0,
                width: 92.0,
              ),
            ),
          )
        : Column(
            children: [
              Container(
                margin: new EdgeInsets.only(
                    left: horizontal ? 0 : 10, top: horizontal ? 16 : 10),
                alignment: FractionalOffset(0.0, 0.0),
                child: ClipOval(
                  child: Image(
                    fit: BoxFit.cover,
                    image: new AssetImage("lib/assets/img/sen-logo.png"),
                    height: 92.0,
                    width: 92.0,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(
                    size.width * 0.10, size.height * 0.02, 0, 0),
                alignment: Alignment.centerLeft,
                child: Text(
                  "SEN",
                  style: TextStyle(
                      fontFamily: 'Odibee Sans',
                      color: Colors.white,
                      fontWeight: FontWeight.w900),
                ),
              )
            ],
          );

    final matchThumbnailRight = horizontal
        ? new Container(
            margin: new EdgeInsets.only(
                right: horizontal ? 25 : 32, top: horizontal ? 16 : 10),
            alignment: FractionalOffset(1.1, 0),
            child: ClipOval(
              child: Image(
                fit: BoxFit.cover,
                image: new AssetImage("lib/assets/img/Fnatic-logo.jpg"),
                height: 92.0,
                width: 92.0,
              ),
            ),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  margin: new EdgeInsets.only(
                      right: horizontal ? 25 : 32, top: horizontal ? 16 : 10),
                  alignment: FractionalOffset(1.1, 0),
                  child: ClipOval(
                    child: Image(
                      fit: BoxFit.cover,
                      image: new AssetImage("lib/assets/img/Fnatic-logo.jpg"),
                      height: 92.0,
                      width: 92.0,
                    ),
                  )),
              Container(
                child: Text(
                  "FNATIC",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                margin: EdgeInsets.fromLTRB(
                    0, size.height * 0.02, size.width * 0.115, 0),
                alignment: Alignment.centerRight,
              )
            ],
          );

    final matchCard = new Container(
      child: matchCardContent,
<<<<<<< HEAD
      height: horizontal ? 124.0 : 154,
      margin: horizontal
          ? new EdgeInsets.only(left: 46.0)
          : new EdgeInsets.only(top: 72.0),
=======
      height: horizontal ? 124.0 : 160,
      margin: horizontal
          ? new EdgeInsets.only(left: 20.0)
          : new EdgeInsets.only(top: 0.0),
>>>>>>> d7cd516ab06940d19f19c60a11b882e044aa02e0
      decoration: new BoxDecoration(
        color: Colors.grey.shade900,
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
                    pageBuilder: (_, __, ___) => new matchDetailsPage(),
                    transitionsBuilder: (context, animation, secondaryAnimation,
                            child) =>
                        new FadeTransition(opacity: animation, child: child),
                  ),
                )
            : null,
        child: new Container(
          margin: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 15.0,
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
