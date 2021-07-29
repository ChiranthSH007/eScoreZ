import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({Key? key}) : super(key: key);

  @override
  _SavedPageState createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1f1a30),
      appBar: AppBar(
        backgroundColor: Color(0xff1f1a30),
        title: Center(child: Text("Saved")),
      ),
      body: Center(
        child: Container(
          child: Text(
            "No Saved Posts",
            style: GoogleFonts.nunito(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
