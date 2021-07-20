import 'package:esportzzz/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class emailsignuppage extends StatefulWidget {
  const emailsignuppage({Key? key}) : super(key: key);

  @override
  _emailsignuppageState createState() => _emailsignuppageState();
}

class _emailsignuppageState extends State<emailsignuppage> {
  bool isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confpasswordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                      controller: _userNameController,
                      keyboardType: TextInputType.name,
                      validator: (item) {
                        return item!.isNotEmpty
                            ? null
                            : "Username should not be empty";
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
                          labelText: 'User Name',
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
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      validator: (item) {
                        return item!.contains("@") ? null : "Enter valid email";
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
                      keyboardType: TextInputType.text,
                      controller: _passwordController,
                      obscureText: true,
                      validator: (item) {
                        return item!.length > 6
                            ? null
                            : "Password must be more than 6 characters";
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
                    // color: Colors.grey[850],
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _confpasswordController,
                      obscureText: true,
                      validator: (item) {
                        return item!.length > 6
                            ? null
                            : "Passwords do not match";
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
                        labelText: 'Confirm Password',
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
                            _register();
                          }
                        },
                        child: Text(
                          "Sign Up",
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

  void _register() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String confpassword = _confpasswordController.text.trim();

    if (password == confpassword) {
      try {
        final User? user = (await _auth.createUserWithEmailAndPassword(
                email: email, password: password))
            .user;

        setState(() {
          if (user != null) {
            Fluttertoast.showToast(msg: "User Created");
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          }
        });
      } catch (e) {
        Fluttertoast.showToast(msg: e.toString());
      }
    } else {
      Fluttertoast.showToast(msg: "Passwords Dont Match");
    }
  }
}
