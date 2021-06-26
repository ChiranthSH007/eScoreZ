import 'package:flutter/material.dart';

class NewsDetail extends StatefulWidget {
  const NewsDetail({Key? key}) : super(key: key);

  @override
  _NewsDetailState createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return new Scaffold(
      backgroundColor: Colors.black,
      body: new Container(
          child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: size.width * 1.0,
                height: size.height * 0.25,
                child: new Image(
                  image: new AssetImage("lib/assets/img/vctmastersimage.jpg"),
                  height: size.height * 0.12,
                  width: size.width * 0.24,
                  fit: BoxFit.cover,
                ),
              ),
              _getToolbar(context),
            ],
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0.0, size.height * 0.05, 0.0, 0.0),
            child: Text(
              'THE VCT Masters Final is now officially over',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins",
                  fontSize: 30),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0.0, size.height * 0.05, 0.0, 0.0),
            child: Text(
                'Sentinels defeat Fnatic to grab the title of VCT masters by score 3-0. Sentinels have been crowned winners of Valorant Champions Tour Masters, Reykjavik. The North American side defeated Fnatic in the Grand Finals to claim the title in the very first Valorant International LAN event.Sentinels reached the Grand Finals without losing a single match in the tournament. They beat Nuturn Gaming in the Upper Bracket Finals and secured their place in the grand finals. ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins",
                )),
          ),
        ],
      )),
    );
  }

  Container _getToolbar(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: new BackButton(color: Colors.white),
    );
  }
}
