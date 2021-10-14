import 'package:esportzzz/Login_Auth/email_vrfy.dart';
import 'package:esportzzz/Main_Pages/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

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
  bool _isUserEmailVerified = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff1f1a30),
      body: isLoading
          ? CircularProgressIndicator()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Stack(
                    children: [
                      _getToolbar(context),
                      Container(
                        padding: EdgeInsets.fromLTRB(15.0, 70.0, 0.0, 0.0),
                        child: Text(
                          'Sign UP',
                          style: GoogleFonts.nunito(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: size.width * 0.135),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(15.0, 140.0, 0.0, 0.0),
                        child: Text(
                          'Welcome to eScoreZ.',
                          style: GoogleFonts.nunito(
                              color: Colors.white,
                              fontSize: size.width * 0.045),
                        ),
                      ),
                    ],
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Container(
                    padding:
                        EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
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
                              prefixIcon: Icon(
                                Icons.person_outline,
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
                              labelText: 'User Name',
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
                              labelStyle:
                                  GoogleFonts.nunito(color: Colors.white),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40.0)),
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                            ),
                            // onTap: () {
                            //   FocusScopeNode currentFocus =
                            //       FocusScope.of(context);
                            //   if (!currentFocus.hasPrimaryFocus) {
                            //     currentFocus.unfocus();
                            //   }
                            // },
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
                                  borderSide: const BorderSide(
                                      color: Colors.transparent),
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
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40.0)),
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              labelText: 'Password',
                              labelStyle:
                                  GoogleFonts.nunito(color: Colors.white),
                              focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40.0)),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent)),
                            ),
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
                            controller: _confpasswordController,
                            obscureText: true,
                            validator: (item) {
                              return item!.length > 6
                                  ? null
                                  : "Passwords do not match";
                            },
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock_open,
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
                              labelText: 'Confirm Password',
                              labelStyle:
                                  GoogleFonts.nunito(color: Colors.white),
                              focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40.0)),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.055,
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
                                  _showMyDialog();
                                } else {
                                  Fluttertoast.showToast(
                                      msg: "Please Enter the Right Credentials",
                                      backgroundColor: Colors.grey[400],
                                      textColor: Colors.black);

                                  // Navigator.pushAndRemoveUntil(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (builder) => Email_Verify(
                                  //             uname: _userNameController.text
                                  //                 .trim(),
                                  //             passwd: _passwordController.text
                                  //                 .trim(),
                                  //             conpasswd: _confpasswordController
                                  //                 .text
                                  //                 .trim(),
                                  //             email: _emailController.text
                                  //                 .trim())),
                                  //     (route) => false);
                                }
                              },
                              child: Text(
                                "Sign Up",
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
                      ],
                    ),
                  ),
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

  // ignore: non_constant_identifier_names
  check_email_verification() async {
    User? user = FirebaseAuth.instance.currentUser;
    print(user);
    await user!.reload();
    if (user.emailVerified) {
      setState(() {
        _isUserEmailVerified = user.emailVerified;
      });
      Fluttertoast.showToast(msg: "User Created and Verified");
    } else {
      print("user details not updated");
    }
    if (_isUserEmailVerified) {
      Fluttertoast.showToast(
          msg: "Registration Successfull",
          backgroundColor: Colors.grey[400],
          textColor: Colors.black);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => HomePage()),
          (Route<dynamic> route) => false);
    } else {
      CircularProgressIndicator();
      Fluttertoast.showToast(
          msg: "Email not verified",
          backgroundColor: Colors.grey[400],
          textColor: Colors.black);
    }
  }

  void _register() async {
    String uname = _userNameController.text.trim();
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String confpassword = _confpasswordController.text.trim();

    //User? userdetails = FirebaseAuth.instance.currentUser;

    if (password == confpassword) {
      try {
        User? user = (await _auth.createUserWithEmailAndPassword(
                email: email, password: password))
            .user;
        await _auth.currentUser!.updateDisplayName(uname);

        // userdetails!.updateDisplayName(uname);
        setState(() {
          print(user);
          print(uname);
          try {
            user!.sendEmailVerification();
            //for registering the username to .displayname

          } catch (e) {
            print("An error occured while trying to send email verification");
            print(e);
            setState(() {
              isLoading = false;
            });
            Fluttertoast.showToast(
                msg: "Error" + e.toString(),
                backgroundColor: Colors.grey[400],
                textColor: Colors.black);
          }
        });
      } catch (e) {
        print(e);
        Fluttertoast.showToast(msg: e.toString());
      }
    } else {
      Fluttertoast.showToast(msg: "Passwords Dont Match");
    }
  }

  Future<void> _showMyDialog() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Email Verified'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Registration Successfull'),
                Text('Please Verify Your Email....!!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Done'),
              onPressed: () {
                check_email_verification();
              },
            ),
          ],
        );
      },
    );
  }

  // for sign it with phone number
  // void signInWithPhoneAuthCred(AuthCredential phoneAuthCredential) async {
  //   try {
  //     final authCred = await _auth.signInWithCredential(phoneAuthCredential);

  //     if (authCred.user != null) {
  //       Navigator.pushAndRemoveUntil(
  //           context,
  //           MaterialPageRoute(builder: (context) => HomePage()),
  //           (route) => false);
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     print(e.message);
  //     ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('Some Error Occured. Try Again Later')));
  //   }
  // }
}
