import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String typeUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.cloud_upload),
      ),
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Center(
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
}

Container buildName() {
  return Container(
    margin: EdgeInsets.only(top: 16),
    width: 250,
    child: TextField(
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
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock),
        border: OutlineInputBorder(),
        hintText: 'Password',
      ),
    ),
  );
}
