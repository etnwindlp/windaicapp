//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildlogo(),
          buildAppName(),
          buildUser(),
          buildPassword(),
        ],
      )),
    );
  }

  Container buildPassword() {
    return Container(
      width: 250,
      // margin: EdgeInsets.only(top: 16),
      margin: EdgeInsets.all(16),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'password',
        ),
        obscureText: true,
      ),
    );
  }

  Container buildUser() {
    return Container(
      width: 250,
      margin: EdgeInsets.only(top: 16),
      child: TextField(
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.font_download),
            border: OutlineInputBorder(),
            hintText: 'username'),
      ),
    );
  }

  Text buildAppName() => Text('Wind AIC App',
      style: GoogleFonts.sedgwickAveDisplay(
          textStyle: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Colors.red.shade500,
              fontStyle: FontStyle.italic)));

  Container buildlogo() =>
      Container(width: 150, child: Image.asset('images/logo.png'));
}
