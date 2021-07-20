import 'dart:ui';

import 'package:esportzzz/forgotpasswordpage.dart';
import 'package:esportzzz/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 60.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 185.0, 0.0, 0.0),
                  child: Text(
                    'Please sign in to continue.',
                    style: TextStyle(
                      fontSize: 20.0,
                      // fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
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
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (item) {
                        return item!.contains("@") ? null : "Enter Valid Email";
                      },
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[850],
                          enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40.0)),
                            borderSide:
                                const BorderSide(color: Colors.purpleAccent),
                          ),
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            fontFamily: 'nunito',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40.0)),
                              borderSide:
                                  BorderSide(color: Colors.purpleAccent))),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    // color: Colors.grey[850],
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      validator: (item) {
                        return item!.length > 6
                            ? null
                            : "Password must be more than 6 charecters";
                      },
                      style: TextStyle(color: Colors.grey),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[850],
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40.0)),
                          borderSide:
                              const BorderSide(color: Colors.purpleAccent),
                        ),
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          fontFamily: 'nunito',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        focusedBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40.0)),
                            borderSide:
                                const BorderSide(color: Colors.purpleAccent)),
                      ),
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
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.purpleAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
                          style: TextStyle(
                              color: Colors.white, fontSize: size.width * 0.04),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.purpleAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(
                                    size.width * 0.5)),
                            side: BorderSide(
                                width: size.width * 0.004,
                                color: Colors.purpleAccent))),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  _signinWithEmailPassword() async {
    try {
      final User? user = (await _firebaseAuth.signInWithEmailAndPassword(
              email: _emailController.text.trim(),
              password: _passwordController.text.trim()))
          .user;

      if (user != null) {
        Fluttertoast.showToast(msg: "Sign In Successfull");
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
