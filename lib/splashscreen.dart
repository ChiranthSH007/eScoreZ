import 'dart:async';

import 'package:esportzzz/login_select_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  _Splash_ScreenState createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  late VideoPlayerController _controller;

  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("lib/assets/eScoreZLogo.mp4");
    _controller.initialize().then((_) {
      //_controller.setLooping(true);
      _controller.play();
    });
    Timer(Duration(seconds: 4), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => Login_Select()),
          (Route<dynamic> rr) => false);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Show a loader until FlutterFire is initialized
    return MaterialApp(
      title: 'eScoreZ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: new Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                width: _controller.value.size.width * 0.5,
                height: _controller.value.size.height * 0.52,
                child: VideoPlayer(_controller),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
