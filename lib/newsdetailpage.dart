import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsDetail extends StatefulWidget {
  String title, description, imgurl;
  NewsDetail({
    Key? key,
    required this.imgurl,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  _NewsDetailState createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return new Scaffold(
      appBar: AppBar(
        title: Center(child: Text('eSportzzz')),
        titleTextStyle: TextStyle(fontSize: 40),

        backgroundColor: Colors.grey[850],

        // elevation: 15,
        // shadowColor: Colors.grey[200],
      ),
      backgroundColor: Colors.black,
      body: new Container(
          child: Column(
        children: [
          Container(
            // padding: EdgeInsets.only(top: size.height * 0.01),
            width: size.width * 1.0,
            height: size.height * 0.25,
            child: CachedNetworkImage(
              imageUrl: widget.imgurl,
              height: size.height * 0.12,
              width: size.width * 0.24,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0.0, size.height * 0.02, 0.0, 0.0),
            child: Text(
              widget.title,
              style: GoogleFonts.rowdies(
                  color: Colors.white,
                  // fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
            // style: TextStyle(
            //     color: Colors.white,
            //     fontWeight: FontWeight.w900,
            //     fontFamily: "Poppins",
            //     fontSize: 25),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0.0, size.height * 0.04, 0.0, 0.0),
            child: Text(
              widget.description,
              style: GoogleFonts.nunito(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w300),
              // style: TextStyle(
              //   color: Colors.white,
              //   fontSize: 18,
              //   fontWeight: FontWeight.w900,
              //   fontFamily: 'Poppins',
              // ),
            ),
          ),
        ],
      )),
    );
  }
}
