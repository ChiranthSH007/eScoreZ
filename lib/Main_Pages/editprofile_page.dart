import 'package:esportzzz/Score_Pages/matchdetailpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _unameController = TextEditingController();
  final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();
  final TextEditingController _currpassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Center(
          child: Text(
            "Edit Profile",
            style: GoogleFonts.nunito(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.width * 0.0475),
          ),
        ),
        backgroundColor: Color(0xff1f1a30),
      ),
      backgroundColor: Color(0xff1f1a30),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 0.0,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(00.0, 40.0, 150.0, 0.0),
                child: Text(
                  'Edit Profile',
                  style: GoogleFonts.nunito(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: size.width * 0.105),
                ),
              ),
              SizedBox(
                height: 35.0,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(5.0, 5.0, 220.0, 0.0),
                child: Text(
                  'Update your UserName',
                  style: GoogleFonts.nunito(
                      color: Colors.white, fontSize: size.width * 0.035),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Form(
                key: _formKey1,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: _unameController,
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
                          borderRadius: BorderRadius.all(Radius.circular(40.0)),
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                        ),
                        labelText: 'User Name',
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40.0)),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40.0)),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        labelStyle: GoogleFonts.nunito(color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40.0)),
                          borderSide: BorderSide(color: Colors.transparent),
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
                ),
              ),
              Container(
                  margin: EdgeInsets.all(5.0),
                  child: ElevatedButton(
                      child: Text(
                        'Update Username',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        if (_formKey1.currentState!.validate()) {
                          _changeUsername();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xff0ef5e3),
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(
                                  size.width * 0.3))))),
              SizedBox(
                height: 20.0,
              ),
              Divider(),
              Container(
                padding: EdgeInsets.fromLTRB(5.0, 5.0, 220.0, 0.0),
                child: Text(
                  'Update your Password',
                  style: GoogleFonts.nunito(
                      color: Colors.white, fontSize: size.width * 0.035),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Form(
                key: _formKey2,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.text,
                      controller: _currpassController,
                      obscureText: true,
                      validator: (item) {
                        return item!.length > 6 ? null : "Enter valid Password";
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock_open,
                          color: Colors.white,
                        ),
                        filled: true,
                        fillColor: Color(0xff39304d),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40.0)),
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40.0)),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40.0)),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        labelText: 'Current Password',
                        labelStyle: GoogleFonts.nunito(color: Colors.white),
                        focusedBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40.0)),
                            borderSide:
                                const BorderSide(color: Colors.transparent)),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.text,
                    controller: _passController,
                    obscureText: true,
                    validator: (item) {
                      return item!.length > 6 ? null : "Enter valid Password";
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock_open,
                        color: Colors.white,
                      ),
                      filled: true,
                      fillColor: Color(0xff39304d),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      labelText: 'New Password',
                      labelStyle: GoogleFonts.nunito(color: Colors.white),
                      focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40.0)),
                          borderSide:
                              const BorderSide(color: Colors.transparent)),
                    ),
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.all(5.0),
                  child: ElevatedButton(
                      child: Text(
                        'Update Password',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        if (_formKey2.currentState!.validate()) {
                          _changePassword();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xff0ef5e3),
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(
                                  size.width * 0.3))))),
            ],
          ),
        ),
      ),
    );
  }

  Future _showDialog(String msg, String title) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                new Text(msg),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                // _currpassController.dispose();
                // _passController.dispose();
                // _unameController.dispose();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future _changePassword() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    //Create an instance of the current user.
    User? user = _auth.currentUser;
    String? currEmail = user!.email;
    //Pass in the password to updatePassword.
    var cred = EmailAuthProvider.credential(
        email: currEmail.toString(), password: _currpassController.text.trim());
    user.reauthenticateWithCredential(cred);
    user.updatePassword(_passController.text.trim()).then((_) {
      _showDialog("Password Changed Successfully..!", "Password Changed");
    }).catchError((error) {
      _showDialog("Password can't be changed", "Password Error");
      //This might happen, when the wrong password is in, the user isn't found, or if the user hasn't logged in recently.
    });
  }

  Future _changeUsername() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    //Create an instance of the current user.
    User? user = _auth.currentUser;
    // String? currEmail = user!.email;
    // //Pass in the password to updatePassword.
    // var cred = EmailAuthProvider.credential(
    //     email: currEmail.toString(), password: _currpassController.text.trim());
    // await user.reauthenticateWithCredential(cred);
    await user!.updateDisplayName(_unameController.text.trim()).then((_) {
      _showDialog("Username Changed Successfully..!", "Username Changed");
    }).catchError((error) {
      _showDialog("Username can't be changed", "Username Error");
      //This might happen, when the wrong password is in, the user isn't found, or if the user hasn't logged in recently.
    });
  }
}
