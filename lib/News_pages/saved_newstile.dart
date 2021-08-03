import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esportzzz/Score_Pages/matchdetailpage.dart';
import 'package:esportzzz/News_pages/newsdetailpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SavedNewsTile extends StatefulWidget {
  String title, description, imgurl, docid;

  SavedNewsTile({
    Key? key,
    required this.imgurl,
    required this.docid,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  _SavedNewsTileState createState() => _SavedNewsTileState();
}

class _SavedNewsTileState extends State<SavedNewsTile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        new PageRouteBuilder(
          pageBuilder: (_, __, ___) => new NewsDetail(
            title: widget.title,
            description: widget.description,
            imgurl: widget.imgurl,
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              new FadeTransition(opacity: animation, child: child),
        ),
      ),
      child: Container(
        color: Color(0xff313243),
        width: size.width * 0.2,
        height: size.height * 0.14,
        padding: EdgeInsets.only(top: 8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: size.width * 0.02),
                CachedNetworkImage(
                  imageUrl: widget.imgurl,
                  height: size.height * 0.12,
                  width: size.width * 0.30,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: size.width * 0.02,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        // padding: const EdgeInsets.fromLTRB(1.0, 35.0, 0.0, 0.0),
                        child: Text(
                          "Valorant",
                          style: TextStyle(
                            color: Colors.purple[300],
                            fontFamily: "Snes",
                            fontSize: 15,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.003,
                      ),
                      Text(
                        widget.title,
                        maxLines: 2,
                        style: GoogleFonts.rowdies(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text(
                        widget.description,
                        maxLines: 1,
                        style: GoogleFonts.raleway(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
