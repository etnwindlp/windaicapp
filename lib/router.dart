import 'package:flutter/material.dart';
import 'package:windaicapp/widget/authen.dart';
import 'package:windaicapp/widget/edit_information.dart';
import 'package:windaicapp/widget/my_service_officer.dart';
import 'package:windaicapp/widget/my_service_user.dart';
import 'package:windaicapp/widget/add_new_job.dart';
import 'package:windaicapp/widget/register.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  '/authen': (BuildContext context) => Authen(),
  '/register': (BuildContext context) => Register(),
  '/serviceuser': (BuildContext context) => MyServiceUser(),
  '/serviceofficer': (BuildContext context) => MyServiceOfficer(),
  '/editinformation': (BuildContext context) => EditInformation(),
  '/addNewJob': (BuildContext context) => AddNewJob(),
};
