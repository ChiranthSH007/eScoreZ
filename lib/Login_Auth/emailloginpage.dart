import 'dart:ui';

import 'package:esportzzz/Login_Auth/forgotpasswordpage.dart';
import 'package:esportzzz/Main_Pages/homepage.dart';
import 'package:esportzzz/Score_Pages/matchdetailpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';

class emaillogin extends StatefulWidget {
  const emaillogin({Key? key}) : super(key: key);

  @override
  _emailloginState createState() => _emailloginState();
}

class _emailloginState extends State<emaillogin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff1f1a30),
      body: Stack(
        children: [
          _getToolbar(context),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.02,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(15.0, 100.0, 0.0, 0.0),
                child: Text(
                  'Login',
                  style: GoogleFonts.nunito(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: size.width * 0.135),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(15.0, 5.0, 0.0, 0.0),
                child: Text(
                  'Please sign in to continue.',
                  style: GoogleFonts.nunito(
                      color: Colors.white, fontSize: size.width * 0.045),
                ),
              ),
              Form(
                key: _formKey,
                child: Container(
                  padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
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
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40.0)),
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              labelText: 'Email',
                              labelStyle:
                                  GoogleFonts.nunito(color: Colors.white),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40.0)),
                                  borderSide:
                                      BorderSide(color: Colors.transparent))),
                          onTap: () {
                            FocusScopeNode currentFocus =
                                FocusScope.of(context);
                            if (!currentFocus.hasPrimaryFocus) {
                              currentFocus.unfocus();
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        // color: Colors.grey[850],
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.text,
                          controller: _passwordController,
                          obscureText: true,
                          validator: (item) {
                            return item!.length > 6
                                ? null
                                : "Password must be more than 6 characters";
                          },
                          //style: TextStyle(color: Colors.grey),
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.password,
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
                            labelText: 'Password',
                            labelStyle: GoogleFonts.nunito(color: Colors.white),
                            focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40.0)),
                                borderSide: const BorderSide(
                                    color: Colors.transparent)),
                          ),
                          onTap: () {
                            FocusScopeNode currentFocus =
                                FocusScope.of(context);
                            if (!currentFocus.hasPrimaryFocus) {
                              currentFocus.unfocus();
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 15.0, left: 20.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ForgotPassword()));
                          },
                          child: Text('Forgot Password?',
                              style: GoogleFonts.nunito(
                                color: Color(0xff0ef5e3),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tightFor(
                          width: size.width * 0.6,
                          height: size.height * 0.06,
                        ),
                        child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _signinWithEmailPassword();
                              }
                            },
                            child: Text(
                              "Log In",
                              style: GoogleFonts.nunito(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xff0ef5e3),
                                shape: RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(
                                        size.width * 0.5)),
                                side: BorderSide(
                                  width: size.width * 0.004,
                                  color: Color(0xff0ef5e3),
                                ))),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        // padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                        child: Text(
                          'OR',
                          style: GoogleFonts.nunito(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: size.width * 0.045),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tightFor(
                          width: size.width * 0.8,
                          height: size.height * 0.06,
                        ),
                        child: SignInButton(
                          Buttons.Google,
                          onPressed: () {
                            signInWithGoogle();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container _getToolbar(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: new BackButton(color: Colors.white),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  _signinWithEmailPassword() async {
    try {
      final User? user = (await _firebaseAuth.signInWithEmailAndPassword(
              email: _emailController.text.trim(),
              password: _passwordController.text.trim()))
          .user;
      await user!.reload();

      if (user.emailVerified) {
        Fluttertoast.showToast(msg: "Sign In Successfull");
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
            (route) => false);
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      print(e);
    }
  }
}
