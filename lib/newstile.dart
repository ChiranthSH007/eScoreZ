import 'package:cached_network_image/cached_network_image.dart';
import 'package:esportzzz/appbar.dart';
import 'package:esportzzz/matchdetailpage.dart';
import 'package:esportzzz/newsdetailpage.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NewsTile extends StatefulWidget {
  String title, description, imgurl;
  NewsTile({
    Key? key,
    required this.imgurl,
    required this.title,
    required this.description,
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
        width: size.width * 0.3,
        height: size.height * 0.19,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: widget.imgurl,
              height: size.height * 0.12,
              width: size.width * 0.30,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: size.width * 0.01,
            ),
            Expanded(
              //padding: const EdgeInsets.fromLTRB(10, 0.1, 10.0, 0.0),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(1.0, 3.0, 0.0, 0.0),
                    child: Text(
                      'Valorant',
                      style: TextStyle(
                        color: Colors.purple,
                        fontSize: 10,
                      ),
                    ),
                  ),
                  Text(
                    widget.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    widget.description,
                    // overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.white,
                        // fontWeight: FontWeight.w600,
                        fontFamily: "Poppins",
                        fontSize: 13),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
