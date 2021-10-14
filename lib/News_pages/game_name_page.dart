import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class gamedetail_page extends StatefulWidget {
  const gamedetail_page({Key? key}) : super(key: key);

  @override
  _gamedetail_pageState createState() => _gamedetail_pageState();
}

class _gamedetail_pageState extends State<gamedetail_page> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xff1f1a30),
      body: Container(
        child: Column(
          children: [
            Container(
              child: CachedNetworkImage(
                // placeholder: (context, url) => Container(
                //   child: Image(
                //     image: AssetImage("lib/assets/img/defaultimage.png"),
                //   ),
                // ),
                imageUrl:
                    "https://images.wallpapersden.com/image/download/valorant-game-team_bGZnbGeUmZqaraWkpJRobWllrWdma2U.jpg",
                height: size.height * 0.3,
                width: size.width,
                fit: BoxFit.cover,
              ),
            ),
            Container()
          ],
        ),
      ),
    );
  }
}
