import 'dart:async';

import 'package:esportzzz/Main_Pages/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:email_auth/email_auth.dart';

class Email_Verify extends StatefulWidget {
  final String uname, passwd, conpasswd, email;

  const Email_Verify({
    Key? key,
    required this.uname,
    required this.passwd,
    required this.conpasswd,
    required this.email,
  }) : super(key: key);

  @override
  _Email_VerifyState createState() => _Email_VerifyState();
}

class _Email_VerifyState extends State<Email_Verify> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _optController = TextEditingController();

  late PhoneAuthCredential cRedphone;
  String butText = "Get OTP";
  bool codessent = false;
  String verificationId = "";
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff1f1a30),
      body: isLoading
          ? CircularProgressIndicator()
          : Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      "Verification",
                      style: GoogleFonts.nunito(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * 0.075),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  Container(
                    child: Text(
                      "We will send you a OTP to your Email-ID ",
                      style: GoogleFonts.nunito(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  // Center(child: Form(key: _formKey, child: pnTextFld())),
                  Container(
                    width: MediaQuery.of(context).size.width - 30,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 1,
                            color: Colors.grey,
                            margin: EdgeInsets.symmetric(horizontal: 12),
                          ),
                        ),
                        Text(
                          "Enter 6 digit OTP",
                          style: GoogleFonts.nunito(color: Colors.white),
                        ),
                        Expanded(
                          child: Container(
                            height: 1,
                            color: Colors.grey,
                            margin: EdgeInsets.symmetric(horizontal: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(40, 10, 40, 30),
                      child: OTPTextField(
                        outlineBorderRadius: 20,
                        length: 6,
                        width: MediaQuery.of(context).size.width / 0.9,
                        otpFieldStyle: OtpFieldStyle(
                          backgroundColor: Color(0xff39304d),
                        ),
                        style: TextStyle(fontSize: 17, color: Colors.white),
                        textFieldAlignment: MainAxisAlignment.spaceEvenly,
                        fieldStyle: FieldStyle.underline,
                        onCompleted: (pin) {
                          setState(() {
                            _optController.text = pin;
                          });
                          // AuthCredential phoneAuthCredential =
                          //     PhoneAuthProvider.credential(
                          //         verificationId: verificationID, smsCode: pin);
                        },
                      ),
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(
                      width: size.width * 0.6,
                      height: size.height * 0.06,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                        } else {
                          Fluttertoast.showToast(
                              msg: "Please Enter the Right Credentials",
                              backgroundColor: Colors.grey[400],
                              textColor: Colors.black);
                        }
                      },
                      child: Text(
                        butText,
                        style: GoogleFonts.nunito(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff0ef5e3),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                new BorderRadius.circular(size.width * 0.5)),
                        side: BorderSide(
                          width: size.width * 0.004,
                          color: Color(0xff0ef5e3),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
