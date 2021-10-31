import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsDetail extends StatefulWidget {
  String title, description, imgurl, docid, uid, source;
  NewsDetail({
    Key? key,
    required this.docid,
    required this.source,
    required this.uid,
    required this.imgurl,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  _NewsDetailState createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {
  late String share_link;
  Color _saveClr = Colors.white;
  IconData _saveIcn = Icons.bookmark_outline;
  Color _likeClr = Colors.pinkAccent;
  IconData _likeIcn = Icons.favorite_outline;

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

    // await createFirstPostLink(widget.source);
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
    super.initState();
    _checkActionStatus();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return new Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "eScoreZ",
              style: GoogleFonts.rowdies(fontSize: 25),
            ),
          ],
        ),
        backgroundColor: Color(0xff1f1a30),
        shadowColor: Color(0xff1f1a30),
      ),
      backgroundColor: Color(0xff1f1a30),
      body: new Container(
          padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
          child: Column(
            children: [
              Container(
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
                padding: EdgeInsets.fromLTRB(
                    0.0, size.height * 0.02, 0.0, size.height * 0.01),
                child: Text(
                  widget.title,
                  style: GoogleFonts.rowdies(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 23),
                ),
              ),
              Container(
                width: size.width * 0.9,
                padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "24h | abcd.com",
                      style: GoogleFonts.nunito(
                          color: Colors.grey, fontSize: size.width * 0.036),
                    ),
                    SizedBox(
                      width: size.width * 0.22,
                    ),
                    IconButton(
                      onPressed: () {
                        _likeAndDislike();
                      },
                      iconSize: 28,
                      icon: Icon(
                        _likeIcn,
                        color: _likeClr,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          _saveAndUnsave();
                        },
                        iconSize: 28,
                        icon: Icon(
                          _saveIcn,
                          color: _saveClr,
                        )),
                    // IconButton(
                    //   onPressed: () {},
                    //   iconSize: 28,
                    //   icon: Icon(
                    //     Icons.share,
                    //     color: Colors.white,
                    //   ),
                    // )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0.0, size.height * 0.01, 0.0, 0.0),
                child: Text(
                  widget.description,
                  style: GoogleFonts.nunito(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
