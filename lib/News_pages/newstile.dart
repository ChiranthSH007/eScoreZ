import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esportzzz/News_pages/game_name_page.dart';
import 'package:esportzzz/Score_Pages/matchdetailpage.dart';
import 'package:esportzzz/News_pages/newsdetailpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class NewsTile extends StatefulWidget {
  String title, description, imgurl, docid, uid, gamename, source;
  Timestamp date;

  NewsTile({
    Key? key,
    required this.gamename,
    required this.date,
    required this.source,
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
  //late String share_link;
  Color _saveClr = Colors.white;
  IconData _saveIcn = Icons.bookmark_outline;
  Color _likeClr = Colors.pinkAccent;
  Color _followClr = Colors.blue;
  late String followTxt = "Follow";
  IconData _likeIcn = Icons.favorite_outline;
  late DateTime created_time, today_time;
  late Duration diff_time;
  var in_time;

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
    setState(() {
      created_time = widget.date.toDate();
      today_time = DateTime.now();
      diff_time = today_time.difference(created_time);
      if (diff_time.inDays >= 1) {
        in_time = diff_time.inDays.toString() + " days ";
      } else if (diff_time.inHours >= 1) {
        in_time = diff_time.inHours.toString() + " hrs ";
      } else if (diff_time.inMinutes >= 1) {
        in_time = diff_time.inMinutes.toString() + "mins ";
      }
    });

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
    //await createFirstPostLink(widget.source);
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

  _followAndUnfollow() async {
    CollectionReference docref =
        FirebaseFirestore.instance.collection("newsdetails");
    var doc = await docref.doc(widget.docid).get();
    Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
    var likeCheckList = data?["FollowIDs"] ?? 0;
    if (likeCheckList == 0) {
      await docref.doc(widget.uid).update({
        "FollowIDs": FieldValue.arrayUnion([widget.uid])
      });
      setState(() {
        followTxt = "Following";
        _followClr = Colors.tealAccent;
        _checkActionStatus();
      });
    } else {
      if (likeCheckList.contains(widget.uid) == true) {
        await docref.doc(widget.docid).update({
          "FollowIDs": FieldValue.arrayRemove([widget.uid])
        });
        setState(() {
          followTxt = "Follow";
          _followClr = Colors.blue;
          _checkActionStatus();
        });
      } else {
        await docref.doc(widget.docid).update({
          "FollowIDs": FieldValue.arrayUnion([widget.uid])
        });
        setState(() {
          followTxt = "Following";
          _followClr = Colors.tealAccent;
          _checkActionStatus();
        });
      }
    }
  }

  // Future<void> createFirstPostLink(String url) async {
  //   final DynamicLinkParameters parameters = DynamicLinkParameters(
  //     uriPrefix: 'https://esportzzz.page.link',
  //     link: Uri.parse(url),
  //     androidParameters: AndroidParameters(
  //       packageName: 'com.example.esportzzz',
  //     ),
  //     // NOT ALL ARE REQUIRED ===== HERE AS AN EXAMPLE =====
  //     // iosParameters: IosParameters(
  //     //   bundleId: 'com.example.ios',
  //     //   minimumVersion: '1.0.1',
  //     //   appStoreId: '123456789',
  //     // ),
  //     // googleAnalyticsParameters: GoogleAnalyticsParameters(
  //     //   campaign: 'example-promo',
  //     //   medium: 'social',
  //     //   source: 'orkut',
  //     // ),
  //     // itunesConnectAnalyticsParameters: ItunesConnectAnalyticsParameters(
  //     //   providerToken: '123456',
  //     //   campaignToken: 'example-promo',
  //     // ),
  //     // socialMetaTagParameters: SocialMetaTagParameters(
  //     //   title: 'Example of a Dynamic Link',
  //     //   description: 'This link works whether app is installed or not!',
  //     // ),
  //   );

  //   final Uri dynamicUrl = await parameters.buildUrl();
  //   setState(() {
  //     share_link = dynamicUrl.toString();
  //   });
  // }

  // Future<void> share() async {
  //   await FlutterShare.share(
  //       linkUrl: share_link,
  //       chooserTitle: 'Example Chooser Title',
  //       title: "Share, Post");
  // }

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
                source: widget.source,
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
                        child: Row(
                          children: [
                            // RichText(
                            //   text: TextSpan(
                            //     style: TextStyle(
                            //         color: Colors.black,
                            //         fontSize:
                            //             MediaQuery.of(context).size.width *
                            //                 0.05),
                            //     children: <TextSpan>[
                            //       TextSpan(
                            //         text: widget.gamename,
                            //         style: GoogleFonts.raleway(
                            //             fontSize: 14,
                            //             fontWeight: FontWeight.bold,
                            //             color: Colors.purple[300]),
                            //         recognizer: TapGestureRecognizer()
                            //           ..onTap = () {
                            //             Navigator.push(
                            //                 context,
                            //                 MaterialPageRoute(
                            //                     builder: (_) =>
                            //                         gamedetail_page()));
                            //           },
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            Text(
                              widget.gamename,
                              style: GoogleFonts.raleway(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.purple[300]),
                            ),
                            SizedBox(
                              width: size.width * 0.02,
                            ),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.05),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: followTxt,
                                    style: GoogleFonts.raleway(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: _followClr),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        _followAndUnfollow();
                                      },
                                  ),
                                ],
                              ),
                            )
                            // Text(
                            //   "Follow",
                            //   style: TextStyle(
                            //     color: Colors.blue,
                            //     fontFamily: "Snes",
                            //     fontSize: 10,
                            //   ),
                            // ),
                          ],
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        in_time.toString() + "ago | ",
                        style: GoogleFonts.nunito(
                            color: Colors.grey, fontSize: 12),
                      ),
                      Text(
                        "widget.source",
                        style: GoogleFonts.nunito(
                            color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                  Row(
                    children: [
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
                      // IconButton(
                      //   onPressed: () {
                      //     share();
                      //   },
                      //   icon: Icon(
                      //     Icons.share,
                      //     color: Colors.white,
                      //   ),
                      // ),
                    ],
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
