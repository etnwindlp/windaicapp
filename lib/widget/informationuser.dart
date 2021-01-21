import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:windaicapp/models/usermodel.dart';
import 'package:windaicapp/utility/myconstant.dart';
import 'package:windaicapp/utility/mystyle.dart';
import 'package:windaicapp/widget/edit_information.dart';

class InformationUser extends StatefulWidget {
  @override
  _InformationUserState createState() => _InformationUserState();
}

class _InformationUserState extends State<InformationUser> {
  String idLogin;
  UserModel userModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findInformation();
  }

  Future<Null> findInformation() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    idLogin = preferences.getString('id');
    print('idLogin = $idLogin');

    String path =
        '${MyConstant().domain}/aic/getUserWhereId.php?isAdd=true&id=$idLogin';
    await Dio().get(path).then((value) {
      print('value ==> $value');
      var result = json.decode(value.data);
      print('result ==> $result');
      for (var item in result) {
        setState(() {
          userModel = UserModel.fromMap(item);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EditInformation(
                      userModel: userModel,
                    ))).then((value) => findInformation()),
        child: Text('Edit'),
      ),
      body: userModel == null
          ? Mystyle().showProgress()
          : userModel.address.isEmpty
              ? Text('Data not fullfill, Pls click edit.')
              : Text('have data'),
    );
  }
}
