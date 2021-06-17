import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class splash_screen extends StatelessWidget {
  const splash_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("Welcome"),
        ),
      ),
    );
  }
}
