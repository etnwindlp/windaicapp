// import 'dart:html';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:windaicapp/utility/dialog.dart';
import 'package:windaicapp/utility/myconstant.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String typeUser = 'user', name, user, password;
  @override
  void initState() {
    super.initState();
    checkInternet();
  }

  Future<Null> checkInternet() async {
    try {
      var result = await InternetAddress.lookup('google.com');
      if ((result.isNotEmpty) && (result[0].rawAddress.isNotEmpty)) {
        print('Internet connected');
      }
    } catch (e) {
      normalDialog(context, 'Internet not connected? Pls try again.');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(
              'typeUser= $typeUser, name = $name, user = $user, password =$password');
          if (name == null ||
              name.isEmpty ||
              (user?.isEmpty ?? true) ||
              (password?.isEmpty ?? true)) {
            print('have space');
            normalDialog(context, 'have space');
          } else if (typeUser == null) {
            normalDialog(context, 'pls should type user');
          } else {
            checkUser();
          }
        },
        child: Icon(Icons.cloud_upload),
      ),
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildName(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildRadioListTileUser(),
                  buildRadioListTileOfficer(),
                ],
              ),
              buildUser(),
              buildPassword(),
            ],
          ),
        ),
      ),
    );
  }

  Container buildRadioListTileUser() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      child: RadioListTile(
          subtitle: Text('for register user'),
          title: Text('user'),
          value: 'user',
          groupValue: typeUser,
          onChanged: (value) {
            setState(() {
              typeUser = value;
            });
          }),
    );
  }

  Container buildRadioListTileOfficer() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      child: RadioListTile(
          subtitle: Text('for register officer'),
          title: Text('officer'),
          value: 'officer',
          groupValue: typeUser,
          onChanged: (value) {
            setState(() {
              typeUser = value;
            });
          }),
    );
  }

  Container buildName() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: 250,
      child: TextField(
        onChanged: (value) => name = value.trim(),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.fingerprint),
          border: OutlineInputBorder(),
          hintText: 'Name',
        ),
      ),
    );
  }

  Container buildUser() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: 250,
      child: TextField(
        onChanged: (value) => user = value.trim(),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.rowing),
          border: OutlineInputBorder(),
          hintText: 'User',
        ),
      ),
    );
  }

  Container buildPassword() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: 250,
      child: TextField(
        onChanged: (value) => password = value.trim(),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock),
          border: OutlineInputBorder(),
          hintText: 'Password',
        ),
      ),
    );
  }

  Future<Null> checkUser() async {
    String path =
        '${MyConstant().domain}/aic/getUserWhereUser.php?isAdd=true&user=$user';

    await Dio().get(path).then((value) {
      // print('value = $value');
      if (value.toString() == 'null') {
        insertUser();
      } else {
        normalDialog(context, '$user is used pls change เปลี่ยน user ซะ');
      }
    });
  }

  Future<Null> insertUser() async {
    String path =
        '${MyConstant().domain}/aic/addUserUng.php?isAdd=true&user=$user&name=$name&password=$password&typeuser=$typeUser';

    await Dio().get(path).then((value) {
      if (value.toString() == 'true') {
        Navigator.pop(context);
      } else {
        normalDialog(context, 'Pls try again');
      }
    });
  }
}
