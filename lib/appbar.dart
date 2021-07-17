import 'package:flutter/material.dart';

class GradientAppBar extends StatelessWidget {
  final String title;
  final double barHeight = 66.0;
  GradientAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      
      padding: new EdgeInsets.only(top: statusBarHeight),
      height: statusBarHeight + barHeight,
      child: new Center(
        child: new Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 30.0),
        ),
      ),
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
            colors: [Colors.grey.shade900, Colors.grey.shade700],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(0.8, 0.0),
            stops: [0.0, 0.5],
            tileMode: TileMode.clamp),
      ),
    );
  }
}
