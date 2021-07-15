import 'dart:ui';

import 'package:flutter/material.dart';

class emaillogin extends StatefulWidget {
  const emaillogin({Key? key}) : super(key: key);

  @override
  _emailloginState createState() => _emailloginState();
}

class _emailloginState extends State<emaillogin> {
  String? login_email, login_password;
  var _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            key: _formkey,
            child: Container(
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: Column(
                children: [
                  Container(
                    // color: Colors.grey[850],
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      validator: (item) {
                        return item!.contains("@") ? null : "Enter Valid Email";
                      },
                      onChanged: (item) {
                        setState(() {
                          login_email = item;
                        });
                      },
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[850],
                          enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
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
                                  BorderRadius.all(Radius.circular(20.0)),
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
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      validator: (item) {
                        return item!.length > 6
                            ? null
                            : "Password must be more than 6 charecters";
                      },
                      onChanged: (item) {
                        setState(() {
                          login_password = item;
                        });
                      },
                      style: TextStyle(color: Colors.grey),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[850],
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
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
                                BorderRadius.all(Radius.circular(20.0)),
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
                  Container(
                    height: 40.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.deepPurpleAccent,
                      color: Colors.purpleAccent,
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: () {
                          if (_formkey.currentState!.validate()) {}
                        },
                        child: Center(
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
