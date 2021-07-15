import 'package:flutter/material.dart';

class emailsignuppage extends StatefulWidget {
  const emailsignuppage({Key? key}) : super(key: key);

  @override
  _emailsignuppageState createState() => _emailsignuppageState();
}

class _emailsignuppageState extends State<emailsignuppage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                    'Sign UP',
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
                    'Welcome to eScoreZ.',
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
          Container(
            padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
            child: Column(
              children: [
                Container(
                  // color: Colors.grey[850],
                  child: TextField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[850],
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              const BorderSide(color: Colors.purpleAccent),
                        ),
                        labelText: 'User Name',
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
                  child: TextField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[850],
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
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
                  child: TextField(
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
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              const BorderSide(color: Colors.purpleAccent)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  // color: Colors.grey[850],
                  child: TextField(
                    style: TextStyle(color: Colors.grey),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[850],
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide:
                            const BorderSide(color: Colors.purpleAccent),
                      ),
                      labelText: 'Confirm Password',
                      labelStyle: TextStyle(
                        fontFamily: 'nunito',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              const BorderSide(color: Colors.purpleAccent)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                // Container(
                //   padding: EdgeInsets.only(top: 15.0, left: 20.0),
                //   child: InkWell(
                //     child: Text(
                //       'Forgot Password?',
                //       style: TextStyle(
                //         color: Colors.purpleAccent,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 20.0,
                // ),
                Container(
                  height: 40.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Colors.deepPurpleAccent,
                    color: Colors.purpleAccent,
                    elevation: 7.0,
                    child: GestureDetector(
                      onTap: () {},
                      child: Center(
                        child: Text(
                          'SIGN UP',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(),
        ],
      ),
    );
  }
}
