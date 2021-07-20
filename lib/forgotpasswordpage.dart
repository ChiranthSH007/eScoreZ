import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
              child: Stack(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(15.0, 160.0, 0.0, 0.0),
                margin: EdgeInsets.only(top: 40.0),
                decoration: new BoxDecoration(
                    color: Colors.black,
                    image: new DecorationImage(
                        image: new AssetImage(
                            "lib/assets/img/forgotpassword.png"))),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(95.0, 225.0, 0.0, 0.0),
                child: Text(
                  'Forgot Your Password?',
                  style: TextStyle(
                    fontSize: 20.0,
                    // fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Container(
                  padding: EdgeInsets.only(top: 295.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: [
                      Container(
                        // color: Colors.grey[850],
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          validator: (item) {
                            return item!.isNotEmpty
                                ? null
                                : "Enter a valid email";
                          },
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[850],
                              enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                borderSide: const BorderSide(
                                    color: Colors.purpleAccent),
                              ),
                              labelText: 'Enter Registered email',
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
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 400.0, left: 80.0),
                child: ConstrainedBox(
                  constraints: BoxConstraints.tightFor(
                    width: size.width * 0.6,
                    height: size.height * 0.06,
                  ),
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Send Request",
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
              ),
            ],
          ))
        ],
      ),
    );
  }
}
