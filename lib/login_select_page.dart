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
      backgroundColor: Colors.black,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              height: size.height * 0.6,
              child: Text(
                "GY",
                style:
                    TextStyle(fontSize: size.height * 0.2, color: Colors.white),
              ),
            ),
            // Container(
            //   margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
            //   height: size.height * 0.006,
            //   width: size.width * 0.95,
            //   color: Colors.grey,
            // ),

            ConstrainedBox(
              constraints: BoxConstraints.tightFor(
                  width: size.width * 0.6, height: size.height * 0.06),
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Log In",
                    style: TextStyle(
                        color: Colors.white, fontSize: size.width * 0.04),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.purpleAccent,
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
                  onPressed: () {},
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Colors.white, fontSize: size.width * 0.04),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              new BorderRadius.circular(size.width * 0.5)),
                      side: BorderSide(
                          width: size.width * 0.004,
                          color: Colors.purpleAccent))),
            ),
          ],
        ),
      ),
    );
  }
}
