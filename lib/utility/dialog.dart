import 'package:flutter/material.dart';

Future<Null> normalDialog(BuildContext context, String s) async {
  showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      title: ListTile(
        leading: Image.asset('images/logo.png'),
        title: Text(s),
      ),
      children: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Ok'),
        ),
      ],
    ),
  );
}
