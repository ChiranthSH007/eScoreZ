import 'package:cached_network_image/cached_network_image.dart';
import 'package:esportzzz/appbar.dart';
import 'package:esportzzz/newsdetailpage.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NewsTile extends StatefulWidget {
  String title, discription, imgurl;
  NewsTile({
    Key? key,
    required this.imgurl,
    required this.title,
    required this.discription,
  }) : super(key: key);

  @override
  _NewsTileState createState() => _NewsTileState();
}

class _NewsTileState extends State<NewsTile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        new PageRouteBuilder(
          pageBuilder: (_, __, ___) => new NewsDetail(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              new FadeTransition(opacity: animation, child: child),
        ),
      ),
      child: Container(
        child: Column(
          children: [
            //new GradientAppBar("eSportzzz"),
            // SizedBox(height: size.height * 0.01),
            Container(
              color: Colors.grey.shade900,
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                leading: Container(
                  padding: EdgeInsets.only(right: 12.0),
                  decoration: new BoxDecoration(
                      border: new Border(
                          right: new BorderSide(
                              width: 1.0, color: Colors.purple.shade400))),
                  child: Container(
                    width: size.width * 0.2,
                    height: size.height * 0.15,
                    child: new CachedNetworkImage(
                      imageUrl: widget.imgurl,
                      height: size.height * 0.12,
                      width: size.width * 0.24,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                title: Text(
                  widget.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins",
                  ),
                ),
                subtitle: Row(
                  children: <Widget>[
                    Flexible(
                        child: Text(widget.discription,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Poppins",
                            ))),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}
