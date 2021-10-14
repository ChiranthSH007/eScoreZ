import 'package:esportzzz/Login_Auth/emailloginpage.dart';
import 'package:esportzzz/Login_Auth/emailsignuppage.dart';
import 'package:esportzzz/Login_Auth/forgotpasswordpage.dart';
import 'package:esportzzz/Login_Auth/email_vrfy.dart';
import 'package:esportzzz/Main_Pages/homepage.dart';
import 'package:esportzzz/Login_Auth/login_select_page.dart';
import 'package:esportzzz/Score_Pages/matchdetailpage.dart';
import 'package:esportzzz/News_pages/newsdetailpage.dart';
import 'package:esportzzz/News_pages/newshomepage.dart';
import 'package:esportzzz/Main_Pages/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
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
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: new Splash_Screen(),
    );
  }
}
