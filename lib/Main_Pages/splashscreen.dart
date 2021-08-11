import 'dart:async';

import 'package:esportzzz/Main_Pages/homepage.dart';
import 'package:esportzzz/Login_Auth/login_select_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  _Splash_ScreenState createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        print(user);
        if (user == null) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => Login_Select()),
              (Route<dynamic> rr) => false);
        } else {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => HomePage()),
              (Route<dynamic> rr) => false);
        }
      });
    });
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
        backgroundColor: Color(0xff1f1a30),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.6,
                child:
                    Image(image: AssetImage("lib/assets/img/editedlogo.png")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
