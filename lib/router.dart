import 'package:flutter/material.dart';
import 'package:windaicapp/widget/authen.dart';
import 'package:windaicapp/widget/register.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  '/authen': (BuildContext context) => Authen(),
  '/register': (BuildContext context) => Register(),
};
