// import 'dart:ffi';
// import 'dart:wasm';

import 'package:flutter/material.dart';
import 'package:windaicapp/widget/authen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Authen(),
    );
  }
}
