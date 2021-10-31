import 'package:esportzzz/Login_Auth/login_select_page.dart';
import 'package:esportzzz/Main_Pages/editprofile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class Profile_Page extends StatefulWidget {
  const Profile_Page({Key? key}) : super(key: key);

  @override
  _Profile_PageState createState() => _Profile_PageState();
}

// ignore: camel_case_types
class _Profile_PageState extends State<Profile_Page> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late final String _uid, _uname, _uemail;

  _checkUserStatus() async {
    final User? user = _auth.currentUser;
    setState(() {
      _uid = user!.uid;
      _uname = user.displayName!;
      _uemail = user.email!;
      print(_uid + _uemail + _uname);
    });
  }

  @override
  void initState() {
    _checkUserStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Profile",
          style: GoogleFonts.nunito(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.width * 0.0475),
        )),
        backgroundColor: Color(0xff1f1a30),
      ),
      backgroundColor: Color(0xff1f1a30),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.08,
            ),
            Center(
              child: CircleAvatar(
                radius: size.width * 0.195,
                backgroundColor: Colors.tealAccent,
                child: CircleAvatar(
                  child: ClipOval(
                    child: Image.network(
                      'https://variety.com/wp-content/uploads/2015/07/naruto_movie-lionsgate.jpg',
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  radius: size.width * 0.18,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Container(
              child: Text(
                _uname,
                style: GoogleFonts.nunito(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.055),
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Container(
              child: Text(
                _uemail,
                style: GoogleFonts.nunito(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.045),
              ),
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            editprofilewid(),
            signoutwid(),
          ],
        ),
      ),
    );
  }

  Widget editprofilewid() {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width * 0.1,
          MediaQuery.of(context).size.height * 0.02,
          MediaQuery.of(context).size.width * 0.1,
          MediaQuery.of(context).size.height * 0.02,
        ),
        child: Row(
          children: [
            Icon(
              Icons.person_outline_rounded,
              color: Colors.tealAccent,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.03,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => EditProfile()));
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xff1f1a30),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              new BorderRadius.circular(size.width * 0.5)),
                      side: BorderSide(
                        width: size.width * 0.004,
                        color: Colors.tealAccent,
                      )),
                  child: Text(
                    "Edit Profile",
                    style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.0475),
                  ),
                ),
                Text(
                  "  Update Your Personal Information",
                  style: GoogleFonts.nunito(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.035),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget signoutwid() {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () async {
        await FirebaseAuth.instance.signOut();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Login_Select()),
            (route) => false);
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width * 0.1,
          MediaQuery.of(context).size.height * 0.02,
          MediaQuery.of(context).size.width * 0.1,
          MediaQuery.of(context).size.height * 0.02,
        ),
        child: Row(
          children: [
            Icon(
              Icons.logout_rounded,
              color: Colors.tealAccent,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.03,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xff1f1a30),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              new BorderRadius.circular(size.width * 0.5)),
                      side: BorderSide(
                        width: size.width * 0.004,
                        color: Colors.tealAccent,
                      )),
                  child: Text("Sign Out",
                      style: GoogleFonts.nunito(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize:
                              MediaQuery.of(context).size.width * 0.0475)),
                ),
                Text(" Logut of Your Account",
                    style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.035))
              ],
            )
          ],
        ),
      ),
    );
  }
}
