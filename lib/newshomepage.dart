import 'package:esportzzz/appbar.dart';
import 'package:esportzzz/operations.dart';
import 'package:flutter/material.dart';

import 'newsdetailpage.dart';

class NewsHome extends StatefulWidget {
  const NewsHome({Key? key}) : super(key: key);

  @override
  _NewsHomeState createState() => _NewsHomeState();
}

class _NewsHomeState extends State<NewsHome> {
  Operations oper = new Operations();
  Stream newsStream;
  @override
  void initState() {
    oper.newstilegetdata().then((result) {
      setState(() {
        newsStream = result;
      });
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (content, index) {}),
            ],
          ),
        )));
  }
}

class NewsTile extends StatefulWidget {
  const NewsTile({Key? key}) : super(key: key);

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
            new GradientAppBar("eSportzzz"),
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
                    child: new Image(
                      image:
                          new AssetImage("lib/assets/img/vctmastersimage.jpg"),
                      height: size.height * 0.12,
                      width: size.width * 0.24,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                title: Text(
                  'THE VCT Masters Final is now officially over',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins",
                  ),
                ),
                subtitle: Row(
                  children: <Widget>[
                    Flexible(
                        child: Text(
                            'Sentinels defeat Fnatic to grab the title of VCT masters by score 3-0',
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
            Container(
              color: Colors.grey.shade900,
              child: ListTile(
                // minVerticalPadding: 10.0,
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
                    child: new Image(
                      image:
                          new AssetImage("lib/assets/img/vctmastersimage.jpg"),
                      height: size.height * 0.12,
                      width: size.width * 0.24,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                title: Text(
                  'HOW WILL KAY/O AFFECT THE VALORANT META?',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins",
                  ),
                ),
                subtitle: Row(
                  children: <Widget>[
                    Flexible(
                        child: Text(
                            'KAY/O can potentially become a different meta creating character',
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
          ],
        ),
      ),
    );
  }
}
