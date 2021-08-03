import 'package:esportzzz/Login_Auth/emailloginpage.dart';
import 'package:esportzzz/Login_Auth/emailsignuppage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class Login_Select extends StatefulWidget {
  const Login_Select({Key? key}) : super(key: key);

  @override
  _Login_SelectState createState() => _Login_SelectState();
}

class _Login_SelectState extends State<Login_Select> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff1f1a30),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                alignment: Alignment.center,
                height: size.height * 0.6,
                width: size.width * 0.9,
                child: Image(
                  image: AssetImage("lib/assets/img/editedlogo.png"),
                ),
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(
                  width: size.width * 0.6, height: size.height * 0.06),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => emaillogin()));
                  },
                  child: Text(
                    "Log In",
                    style: TextStyle(
                        color: Colors.black, fontSize: size.width * 0.04),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xff0ef5e3),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              new BorderRadius.circular(size.width * 0.5)))),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(
                  width: size.width * 0.6, height: size.height * 0.06),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => emailsignuppage()));
                  },
                  child: Text(
                    "Sign Up",
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
                        color: Colors.tealAccent,
                      ))),
            ),
          ],
        ),
      ),
    );
  }
}
