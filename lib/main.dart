import 'package:esportzzz/emailloginpage.dart';
import 'package:esportzzz/emailsignuppage.dart';
import 'package:esportzzz/forgotpasswordpage.dart';
import 'package:esportzzz/homepage.dart';
import 'package:esportzzz/login_select_page.dart';
import 'package:esportzzz/matchdetailpage.dart';
import 'package:esportzzz/newsdetailpage.dart';
import 'package:esportzzz/newshomepage.dart';
import 'package:esportzzz/profilepage.dart';
import 'package:esportzzz/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(ProfileScreen());
}
