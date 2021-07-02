import 'package:cached_network_image/cached_network_image.dart';
import 'package:esportzzz/matchdetailpage.dart';
import 'package:flutter/material.dart';

class MatchRow extends StatefulWidget {
  final bool horizontal;
  final String date,
      logo1url,
      logo2url,
      teamname1,
      teamname2,
      livescoret1,
      livescoret2;

  const MatchRow(
      {Key? key,
      this.horizontal = true,
      required this.date,
      required this.livescoret1,
      required this.livescoret2,
      required this.logo1url,
      required this.logo2url,
      required this.teamname1,
      required this.teamname2})
      : super(key: key);

  @override
  _MatchRowState createState() => _MatchRowState();
}

class _MatchRowState extends State<MatchRow> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //
    final matchCardContent = new Container(
      margin: new EdgeInsets.fromLTRB(
          widget.horizontal ? size.width * 0 : size.width * 0.03,
          widget.horizontal ? size.height * 0.01 : size.height * 0.04,
          size.width * 0.01,
          size.height * 0.005),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment: widget.horizontal
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: <Widget>[
          new Container(height: size.height * 0.002),
          widget.horizontal
              ? Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        new Text(
                          widget.teamname1,
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontSize: size.width * 0.04,
                              fontWeight: FontWeight.w600),
                        ),
                        new Text(
                          "    vs    ",
                          style: TextStyle(color: Colors.white),
                        ),
                        new Text(
                          widget.teamname2,
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontSize: size.width * 0.04,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.015,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            widget.livescoret1 + " - " + widget.livescoret2,
                            style: TextStyle(
                                fontSize: size.width * 0.05,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              : Container(
                  padding: EdgeInsets.all(size.width * 0.02),
                  width: size.width * 0.22,
                  child: Center(
                    child: Text(
                      widget.livescoret1 + " - " + widget.livescoret2,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * 0.05),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.grey.shade800,
                      border: Border.all(
                          color: Colors.white, width: size.width * 0.002)),
                ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              new Container(height: size.height * 0.01),
              new Container(
                margin: new EdgeInsets.symmetric(vertical: size.height * 0.008),
                height: size.height * 0.002,
                width: size.width * 0.2,
                color: new Color(0xff00c6ff),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              new Text(
                widget.date,
                style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: size.width * 0.026,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    );

    final matchThumbnailLeft = widget.horizontal
        ? new Container(
            margin: new EdgeInsets.only(
                left: widget.horizontal ? 0 : 10,
                top: widget.horizontal ? 16 : 10),
            alignment: FractionalOffset(0.0, 0.0),
            child: ClipOval(
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: widget.logo1url,
                height: 92.0,
                width: 92.0,
              ),
            ),
          )
        : Column(
            children: [
              Container(
                margin: new EdgeInsets.only(
                    left: widget.horizontal ? 0 : 10,
                    top: widget.horizontal ? 16 : 10),
                alignment: FractionalOffset(0.0, 0.0),
                child: ClipOval(
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: widget.logo1url,
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
                  widget.teamname1,
                  style: TextStyle(
                      fontFamily: 'Odibee Sans',
                      color: Colors.white,
                      fontWeight: FontWeight.w900),
                ),
              )
            ],
          );

    final matchThumbnailRight = widget.horizontal
        ? new Container(
            margin: new EdgeInsets.only(
                right: widget.horizontal ? 25 : 32,
                top: widget.horizontal ? 16 : 10),
            alignment: FractionalOffset(1.1, 0),
            child: ClipOval(
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: widget.logo2url,
                height: 92.0,
                width: 92.0,
              ),
            ),
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  margin: new EdgeInsets.only(
                      right: widget.horizontal ? 25 : 32,
                      top: widget.horizontal ? 16 : 10),
                  alignment: FractionalOffset(1.1, 0),
                  child: ClipOval(
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: widget.logo2url,
                      height: 92.0,
                      width: 92.0,
                    ),
                  )),
              Container(
                child: Text(
                  widget.teamname2,
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
      height: widget.horizontal ? 124.0 : 160,
      margin: widget.horizontal
          ? new EdgeInsets.fromLTRB(15, 0, 15, 0)
          : new EdgeInsets.only(top: 0.0),
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
        onTap: widget.horizontal
            ? () => Navigator.of(context).push(
                  new PageRouteBuilder(
                    pageBuilder: (_, __, ___) => new matchDetailsPage(
                      date: widget.date,
                      livescoret1: widget.livescoret1,
                      livescoret2: widget.livescoret2,
                      teamname1: widget.teamname1,
                      teamname2: widget.teamname2,
                      logo1url: widget.logo1url,
                      logo2url: widget.logo2url,
                    ),
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
