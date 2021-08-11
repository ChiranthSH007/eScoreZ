import 'package:esportzzz/Login_Auth/emailloginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff1f1a30),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _getToolbar(context),
            Container(
              padding: EdgeInsets.fromLTRB(15.0, 20.0, 0.0, 0.0),
              child: Text(
                'Reset Password',
                style: GoogleFonts.nunito(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: size.width * 0.1),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(15.0, 10.0, 0.0, 0.0),
              child: Text('Forgot Your Password ?',
                  style: GoogleFonts.nunito(
                      color: Colors.white, fontSize: size.width * 0.045)),
            ),
            Form(
              key: _formKey,
              child: Container(
                padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                child: Column(
                  children: [
                    Container(
                      // color: Colors.grey[850],
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        validator: (item) {
                          return item!.contains("@")
                              ? null
                              : "Enter valid email";
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: Colors.white,
                            ),
                            filled: true,
                            fillColor: Color(0xff39304d),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40.0)),
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40.0)),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40.0)),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            labelText: 'Email',
                            labelStyle: GoogleFonts.nunito(color: Colors.white),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40.0)),
                                borderSide:
                                    BorderSide(color: Colors.transparent))),
                        onTap: () {
                          FocusScopeNode currentFocus = FocusScope.of(context);
                          if (!currentFocus.hasPrimaryFocus) {
                            currentFocus.unfocus();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50.0, left: 80.0),
              child: ConstrainedBox(
                constraints: BoxConstraints.tightFor(
                  width: size.width * 0.6,
                  height: size.height * 0.06,
                ),
                child: ElevatedButton(
                    onPressed: () {
                      resetPassword();
                      Fluttertoast.showToast(msg: "Email Sent !");
                      setState(() {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => emaillogin()));
                      });
                    },
                    child: Text(
                      "Send Request",
                      style: TextStyle(
                          color: Colors.white, fontSize: size.width * 0.04),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xff1f1a30),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                new BorderRadius.circular(size.width * 0.5)),
                        side: BorderSide(
                            width: size.width * 0.004,
                            color: Colors.tealAccent))),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _getToolbar(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: new BackButton(color: Colors.white),
    );
  }

  resetPassword() async {
    String email = _emailController.text.trim();
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
