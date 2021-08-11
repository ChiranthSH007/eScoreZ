import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esportzzz/Score_Pages/matchdetailpage.dart';
import 'package:esportzzz/News_pages/newsdetailpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class NewsTile extends StatefulWidget {
  String title, description, imgurl, docid, uid;
  NewsTile({
    Key? key,
    required this.uid,
    required this.imgurl,
    required this.docid,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  _NewsTileState createState() => _NewsTileState();
}

class _NewsTileState extends State<NewsTile> {
  Color _saveClr = Colors.white;
  IconData _saveIcn = Icons.bookmark_outline;
  Color _likeClr = Colors.pinkAccent;
  IconData _likeIcn = Icons.favorite_outline;

  onGoBack(dynamic value) {
    _checkActionStatus();
    setState(() {});
  }

  _checkActionStatus() async {
    var docref = FirebaseFirestore.instance.collection("newsdetails");

    var doc = await docref.doc(widget.docid).get();
    Map<String, dynamic>? data = doc.data();
    var saveCheckList = data?["SavedIDs"] ?? 0; // Default value if its null
    var likeCheckList = data?["LikeIDs"] ?? 0;
    if (saveCheckList != 0) {
      if (saveCheckList.contains(widget.uid) == true) {
        setState(() {
          _saveClr = Colors.tealAccent;
          _saveIcn = Icons.bookmark;
        });
      }
    }
    if (likeCheckList != 0) {
      if (likeCheckList.contains(widget.uid) == true) {
        setState(() {
          _likeClr = Colors.pinkAccent;
          _likeIcn = Icons.favorite;
        });
      }
    }
  }

  _saveAndUnsave() async {
    CollectionReference docref =
        FirebaseFirestore.instance.collection("newsdetails");
    var doc = await docref.doc(widget.docid).get();
    Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
    var saveCheckList = data?["SavedIDs"] ?? 0;
    if (saveCheckList == 0) {
      await docref.doc(widget.uid).update({
        "SavedIDs": FieldValue.arrayUnion([widget.uid])
      });
      setState(() {
        _saveIcn = Icons.bookmark;
        _saveClr = Colors.tealAccent;
        _checkActionStatus();
      });
    } else {
      if (saveCheckList.contains(widget.uid) == true) {
        await docref.doc(widget.docid).update({
          "SavedIDs": FieldValue.arrayRemove([widget.uid])
        });
        setState(() {
          _saveIcn = Icons.bookmark_outline;
          _saveClr = Colors.white;
          _checkActionStatus();
        });
      } else {
        await docref.doc(widget.docid).update({
          "SavedIDs": FieldValue.arrayUnion([widget.uid])
        });
        setState(() {
          _saveIcn = Icons.bookmark;
          _saveClr = Colors.tealAccent;
          _checkActionStatus();
        });
      }
    }
  }

  _likeAndDislike() async {
    CollectionReference docref =
        FirebaseFirestore.instance.collection("newsdetails");
    var doc = await docref.doc(widget.docid).get();
    Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
    var likeCheckList = data?["LikeIDs"] ?? 0;
    if (likeCheckList == 0) {
      await docref.doc(widget.uid).update({
        "LikeIDs": FieldValue.arrayUnion([widget.uid])
      });
      setState(() {
        _likeIcn = Icons.favorite;
        _likeClr = Colors.pinkAccent;
        _checkActionStatus();
      });
    } else {
      if (likeCheckList.contains(widget.uid) == true) {
        await docref.doc(widget.docid).update({
          "LikeIDs": FieldValue.arrayRemove([widget.uid])
        });
        setState(() {
          _likeIcn = Icons.favorite_outline;
          _likeClr = Colors.pinkAccent;
          _checkActionStatus();
        });
      } else {
        await docref.doc(widget.docid).update({
          "LikeIDs": FieldValue.arrayUnion([widget.uid])
        });
        setState(() {
          _likeIcn = Icons.favorite;
          _likeClr = Colors.pinkAccent;
          _checkActionStatus();
        });
      }
    }
  }

  @override
  void initState() {
    _checkActionStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .push(
            new PageRouteBuilder(
              pageBuilder: (_, __, ___) => new NewsDetail(
                docid: widget.docid,
                uid: widget.uid,
                title: widget.title,
                description: widget.description,
                imgurl: widget.imgurl,
              ),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      new FadeTransition(opacity: animation, child: child),
            ),
          )
          .then(onGoBack),
      onDoubleTap: () => _likeAndDislike(),
      child: Container(
        color: Color(0xff313243),
        width: size.width * 0.2,
        height: size.height * 0.2,
        padding: EdgeInsets.only(top: 8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: size.width * 0.02),
                Container(
                  child: CachedNetworkImage(
                    placeholder: (context, url) => Container(
                      child: Image(
                        image: AssetImage("lib/assets/img/defaultimage.png"),
                      ),
                    ),
                    imageUrl: widget.imgurl,
                    height: size.height * 0.12,
                    width: size.width * 0.30,
                    fit: BoxFit.cover,
                  ),
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
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Row(
                children: [
                  Text(
                    "24h | abcd.com",
                    style: GoogleFonts.nunito(color: Colors.grey),
                  ),
                  SizedBox(
                    width: size.width * 0.36,
                  ),
                  IconButton(
                    onPressed: () {
                      _likeAndDislike();
                    },
                    icon: Icon(
                      _likeIcn,
                      color: _likeClr,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        _saveAndUnsave();
                      },
                      icon: Icon(
                        _saveIcn,
                        color: _saveClr,
                      )),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.share,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
