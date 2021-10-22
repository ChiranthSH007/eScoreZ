import 'package:esportzzz/Score_Pages/matchdetailpage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var editprofilecontroller1;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Edit Profile",
            style: GoogleFonts.nunito(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.width * 0.0475),
          ),
        ),
        backgroundColor: Color(0xff1f1a30),
      ),
      backgroundColor: Color(0xff1f1a30),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 0.0,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(00.0, 40.0, 150.0, 0.0),
              child: Text(
                'Edit Profile',
                style: GoogleFonts.nunito(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: size.width * 0.105),
              ),
            ),
            SizedBox(
              height: 35.0,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(5.0, 5.0, 220.0, 0.0),
              child: Text(
                'Update your UserName',
                style: GoogleFonts.nunito(
                    color: Colors.white, fontSize: size.width * 0.035),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: TextFormField(
                  initialValue: "UserName",
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      // contentPadding: EdgeInsets.only(left: 55.0),
                      prefixIcon: Icon(
                        Icons.people_alt_outlined,
                        color: Colors.white,
                      ),
                      filled: true,
                      fillColor: Color(0xff39304d),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      labelText: 'Username',
                      labelStyle: GoogleFonts.nunito(color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40.0)),
                          borderSide: BorderSide(color: Colors.transparent))),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.all(5.0),
                child: ElevatedButton(
                    child: Text('Update Username'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xff0ef5e3),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                new BorderRadius.circular(size.width * 0.3))))),
            SizedBox(
              height: 20.0,
            ),
            Divider(),
            Container(
              padding: EdgeInsets.fromLTRB(5.0, 5.0, 220.0, 0.0),
              child: Text(
                'Update your Password',
                style: GoogleFonts.nunito(
                    color: Colors.white, fontSize: size.width * 0.035),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: TextFormField(
                  controller: editprofilecontroller1,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.password_outlined,
                        color: Colors.white,
                      ),
                      filled: true,
                      fillColor: Color(0xff39304d),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      labelText: 'New Password',
                      labelStyle: GoogleFonts.nunito(color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40.0)),
                          borderSide: BorderSide(color: Colors.transparent))),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: TextFormField(
                  controller: editprofilecontroller1,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.password_outlined,
                        color: Colors.white,
                      ),
                      filled: true,
                      fillColor: Color(0xff39304d),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      labelText: 'Confirm Password',
                      labelStyle: GoogleFonts.nunito(color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40.0)),
                          borderSide: BorderSide(color: Colors.transparent))),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.all(5.0),
                child: ElevatedButton(
                    child: Text('Update Password'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xff0ef5e3),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                new BorderRadius.circular(size.width * 0.3))))),
          ],
        ),
      ),
    );
  }
}
