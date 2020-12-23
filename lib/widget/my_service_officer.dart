import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:windaicapp/utility/myconstant.dart';
import 'package:windaicapp/utility/mystyle.dart';
import 'package:windaicapp/widget/page2.dart';
import 'package:windaicapp/widget/showlistjob.dart';

class MyServiceOfficer extends StatefulWidget {
  @override
  _MyServiceOfficerState createState() => _MyServiceOfficerState();
}

class _MyServiceOfficerState extends State<MyServiceOfficer> {
  String nameLogin;
  Widget currentWidget = ShowlistJob();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findLogin();
  }

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
      child: Stack(
        children: [
          Column(
            children: [
              buildUserAccountsDrawerHeader(),
              buildMenuShowJob(),
              buildMenuPage2()
            ],
          ),
          Mystyle().buildSignOut(context),
        ],
      ),
    );
  }

  ListTile buildMenuShowJob() {
    return ListTile(
      leading: Icon(Icons.list),
      title: Text('Show list job'),
      subtitle: Text('Task list'),
      onTap: () {
        Navigator.pop(context);
        setState(() {
          currentWidget = ShowlistJob();
        });
      },
    );
  }

  ListTile buildMenuPage2() {
    return ListTile(
      leading: Icon(Icons.filter_2),
      title: Text('Page 2'),
      subtitle: Text('Display Page 2'),
      onTap: () {
        Navigator.pop(context);
        setState(() {
          currentWidget = Page2();
        });
      },
    );
  }

  UserAccountsDrawerHeader buildUserAccountsDrawerHeader() {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'images/astronaut.jpg',
              ),
              fit: BoxFit.cover)),
      currentAccountPicture: Image.asset('images/logo.png'),
      accountName: nameLogin == null ? Text('name') : Text(nameLogin),
      accountEmail: Text('logined'),
    );
  }
}
