//import 'dart:html';

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:windaicapp/models/usermodel.dart';
import 'package:windaicapp/utility/dialog.dart';
import 'package:windaicapp/utility/myconstant.dart';
import 'package:windaicapp/utility/mystyle.dart';

//stf
class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  bool statusRedEye = true, statusProgress = true;
  String user, password;
  int count = 0;

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
        child: Stack(
          children: [
            buildContent(),
            statusProgress ? SizedBox() : Mystyle().showProgress(),
          ],
        ),
      ),
    );
  }

  Center buildContent() {
    return Center(
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
    ));
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
        child: ElevatedButton(
            onPressed: () {
              if ((user?.isEmpty ?? true) || (password?.isEmpty ?? true)) {
                normalDialog(context, 'pls insert username or password');
              } else {
                setState(() {
                  statusProgress = false;
                });
                checkAuthen();
              }
            },
            child: Text('login')));
  }

  Container buildPassword() {
    return Container(
      width: 250,
      // margin: EdgeInsets.only(top: 16),
      margin: EdgeInsets.all(16),
      child: TextField(
        onChanged: (value) => password = value.trim(),
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
        onChanged: (value) => user = value.trim(),
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

  Future<Null> checkAuthen() async {
    String path =
        '${MyConstant().domain}/aic/getUserWhereUser.php?isAdd=true&user=$user&password=$password';

    await Dio().get(path).then((value) async {
      if (value.toString() == 'null') {
        setState(() {
          statusProgress = true;
        });
        normalDialog(context, 'Does have $user on database.');
        count++;
        checkCount();
      } else {
        print('value = $value');
        var result = json.decode(value.data);
        print('$result');
        for (var item in result) {
          print('item = $item');
          UserModel model = UserModel.fromMap(item);
          if (password == model.password) {
            print('Login success');

            SharedPreferences preferences =
                await SharedPreferences.getInstance();
            preferences.setString(MyConstant().keyName, model.name);
            preferences.setString(MyConstant().keyType, model.typeuser);
            preferences.setString('id', model.id);

            switch (model.typeuser) {
              case 'user':
                Navigator.pushNamedAndRemoveUntil(
                    context, '/serviceuser', (route) => false);

                break;

              case 'officer':
                Navigator.pushNamedAndRemoveUntil(
                    context, '/serviceofficer', (route) => false);

                break;

              default:
            }
          } else {
            setState(() {
              statusProgress = true;
            });
            normalDialog(context, 'Password Incorrected.');
            count++;
            checkCount();
          }
        }
      }
    });
  }

  void checkCount() {
    if (count >= 4) {
      normalDialog(context, 'Login incorrected more then 5 times.');
    }
  }
}
