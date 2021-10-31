import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

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
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                    Colors.grey.withOpacity(0.0),
                    Colors.black,
                  ],
                  stops: [
                    0.0,
                    1.0
                  ])),
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
        Positioned(
          left: 130,
          right: 130,
          top: 170,
          child: Container(
            width: 110,
            height: 110,
            decoration: BoxDecoration(
              border: Border.all(
                width: 4,
                color: Colors.tealAccent,
              ),
              color: Colors.tealAccent,
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1403184855316267016/OU7KAc2z.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Column(
          children: [
            Container(
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.nunito(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xff0ef5e3),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  new BorderRadius.circular(size.width * 0.5)),
                          side: BorderSide(
                            width: size.width * 0.004,
                            color: Color(0xff0ef5e3),
                          ))),
                ],
              ),
            )
          ],
        ),
      ]),
    );
  }
}
