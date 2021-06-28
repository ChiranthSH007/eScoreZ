<<<<<<< HEAD
import 'package:flutter/material.dart';

import 'appbar.dart';
import 'newsdetailpage.dart';

class NewsTile extends StatefulWidget {
  String title;
  NewsTile({Key? key, required this.title}) : super(key: key);
=======
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
>>>>>>> a70331ba97f64df7f7d9d4951bc7a6320961b3f1

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
<<<<<<< HEAD
            // new GradientAppBar("eSportzzz"),
=======
            //new GradientAppBar("eSportzzz"),
>>>>>>> a70331ba97f64df7f7d9d4951bc7a6320961b3f1
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
<<<<<<< HEAD
                    child: new Image(
                      image:
                          new AssetImage("lib/assets/img/vctmastersimage.jpg"),
=======
                    child: new CachedNetworkImage(
                      imageUrl: widget.imgurl,
>>>>>>> a70331ba97f64df7f7d9d4951bc7a6320961b3f1
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
<<<<<<< HEAD
                        child: Text(
                            'Sentinels defeat Fnatic to grab the title of VCT masters by score 3-0',
=======
                        child: Text(widget.discription,
>>>>>>> a70331ba97f64df7f7d9d4951bc7a6320961b3f1
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
