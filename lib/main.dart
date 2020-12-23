// import 'dart:ffi';
// import 'dart:wasm';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:windaicapp/router.dart';
import 'package:windaicapp/utility/myconstant.dart';
// import 'package:windaicapp/widget/authen.dart';

var myInitial;

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String type = preferences.getString(MyConstant().keyType);
  print('type ==> $type');

  if (type != null) {
    switch (type) {
      case 'user':
        myInitial = '/serviceuser';
        break;

      case 'officer':
        myInitial = '/serviceofficer';
        break;
      default:
    }
  } else {
    myInitial = '/authen';
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      debugShowCheckedModeBanner: false,
      // home: Authen(),
      routes: routes,
      // initialRoute: '/authen',
      initialRoute: myInitial,
    );
  }
}
