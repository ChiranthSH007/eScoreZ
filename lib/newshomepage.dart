import 'package:flutter/material.dart';

class NewsHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          child: Container(
            child: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.10,
                    ),
                    Container(
                      color: Colors.grey.shade900,
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        leading: Container(
                          padding: EdgeInsets.only(right: 12.0),
                          decoration: new BoxDecoration(
                              border: new Border(
                                  right: new BorderSide(
                                      width: 1.0,
                                      color: Colors.purple.shade400))),
                          child: Container(
                            width: size.width * 0.2,
                            height: size.height * 0.15,
                            child: new Image(
                              image: new AssetImage(
                                  "lib/assets/img/vctmastersimage.jpg"),
                              height: size.height * 0.12,
                              width: size.width * 0.24,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        title: Text(
                          'THE VCT Masters Final is now officially over',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Row(
                          children: <Widget>[
                            Flexible(
                                child: Text(
                                    'Sentinels defeat Fnatic to grab the title of VCT masters by score 3-0',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(color: Colors.white))),
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
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        leading: Container(
                          padding: EdgeInsets.only(right: 12.0),
                          decoration: new BoxDecoration(
                              border: new Border(
                                  right: new BorderSide(
                                      width: 1.0,
                                      color: Colors.purple.shade400))),
                          child: Container(
                            width: size.width * 0.2,
                            height: size.height * 0.15,
                            child: new Image(
                              image: new AssetImage(
                                  "lib/assets/img/vctmastersimage.jpg"),
                              height: size.height * 0.12,
                              width: size.width * 0.24,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        title: Text(
                          'HOW WILL KAY/O AFFECT THE VALORANT META?',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Row(
                          children: <Widget>[
                            Flexible(
                                child: Text(
                                    'KAY/O can potentially become a different meta creating character',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(color: Colors.white))),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                _getToolbar(context)
              ],
            ),
          ),
        ));
  }

  Container _getToolbar(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: new BackButton(color: Colors.white),
    );
  }
}
