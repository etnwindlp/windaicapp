//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  bool statusRedEye = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0, -0.3),
            radius: 0.8,
            colors: <Color>[Colors.white, Colors.black],
          ),
        ),
        child: Center(
            child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildlogo(),
              buildAppName(),
              buildUser(),
              buildPassword(),
              buildLogin(),
              buildRegister()
            ],
          ),
        )),
      ),
    );
  }

  TextButton buildRegister() => TextButton(
      onPressed: () {
        Navigator.pushNamed(context, '/register');
      },
      child: Text('New Register'));

  Container buildLogin() {
    return Container(
        width: 250,
        margin: EdgeInsets.only(top: 16),
        child: ElevatedButton(onPressed: () {}, child: Text('login')));
  }

  Container buildPassword() {
    return Container(
      width: 250,
      // margin: EdgeInsets.only(top: 16),
      margin: EdgeInsets.all(16),
      child: TextField(
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(Icons.remove_red_eye),
            onPressed: () {
              setState(() {
                statusRedEye = !statusRedEye;
              });
              print('object statusRedEye = $statusRedEye');
            },
          ),
          prefixIcon: Icon(Icons.vpn_key),
          border: OutlineInputBorder(),
          hintText: 'password',
        ),
        obscureText: statusRedEye,
      ),
    );
  }

  Container buildUser() {
    return Container(
      width: 250,
      margin: EdgeInsets.only(top: 16),
      child: TextField(
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.info),
            border: OutlineInputBorder(),
            hintText: 'username'),
      ),
    );
  }

  Text buildAppName() => Text('Wind AIC App',
      style: GoogleFonts.bungeeOutline(
          textStyle: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Colors.red.shade500,
              fontStyle: FontStyle.italic)));

  Container buildlogo() =>
      Container(width: 150, child: Image.asset('images/logo.png'));
}
