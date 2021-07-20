import 'package:esportzzz/emailloginpage.dart';
import 'package:esportzzz/emailsignuppage.dart';
import 'package:esportzzz/forgotpasswordpage.dart';
import 'package:esportzzz/homepage.dart';
import 'package:esportzzz/login_select_page.dart';
import 'package:esportzzz/matchdetailpage.dart';
import 'package:esportzzz/newsdetailpage.dart';
import 'package:esportzzz/newshomepage.dart';
import 'package:esportzzz/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _initialized = false;
  bool _error = false;
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  void initState() {
    super.initState();
    initializeFlutterFire();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (_error) {
      print("ERROR IS      ");
      print(_error);
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return CircularProgressIndicator();
    }
    return MaterialApp(
      title: 'eScoreZ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: new Login_Select(),
    );
  }
}
