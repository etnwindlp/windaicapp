import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:windaicapp/utility/myconstant.dart';
import 'package:windaicapp/utility/mystyle.dart';
import 'package:windaicapp/widget/informationuser.dart';

class MyServiceUser extends StatefulWidget {
  @override
  _MyServiceUserState createState() => _MyServiceUserState();
}

class _MyServiceUserState extends State<MyServiceUser> {
  String nameLogin;

  Widget currentWidget = InformationUser();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findLogin();
    // currentWidget();
  }

  // Future<Null> currentWidget() async {}

  Future<Null> findLogin() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      nameLogin = preferences.getString(MyConstant().keyName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            nameLogin == null
                ? 'Welcome Officer:'
                : 'Welcome Officer: $nameLogin',
            style: GoogleFonts.lobster(
                textStyle: TextStyle(
                    fontSize: 22,
                    // fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontStyle: FontStyle.italic))),
      ),
      drawer: buildDrawer(context),
      body: currentWidget,
    );
  }

  Drawer buildDrawer(BuildContext context) {
    return Drawer(
      child: Mystyle().buildSignOut(context),
    );
  }
}
