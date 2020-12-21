import 'package:flutter/material.dart';

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
        ],
      )),
    );
  }

  Text buildAppName() => Text(
        'Wind AIC App',
        style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Colors.red.shade500,
            fontStyle: FontStyle.italic),
      );

  Container buildlogo() =>
      Container(width: 150, child: Image.asset('images/logo.png'));
}
