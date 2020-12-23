import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Mystyle {
  Widget showProgress() => Center(
          child: CircularProgressIndicator(
        backgroundColor: Colors.white,
        strokeWidth: 5,
      ));

  TextStyle blackStyle() => TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      );

  Widget buildSignOut(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ListTile(
          onTap: () async {
            SharedPreferences preferences =
                await SharedPreferences.getInstance();
            preferences.clear();
            Navigator.pushNamedAndRemoveUntil(
                context, '/authen', (route) => false);
          },
          tileColor: Colors.black,
          leading: Icon(
            Icons.exit_to_app,
            color: Colors.white,
            size: 36,
          ),
          title: Text(
            'Sign Out',
            style: Mystyle().blackStyle(),
          ),
        ),
      ],
    );
  }

  Mystyle();
}
