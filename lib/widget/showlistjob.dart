import 'package:flutter/material.dart';

class ShowlistJob extends StatefulWidget {
  @override
  _ShowlistJobState createState() => _ShowlistJobState();
}

class _ShowlistJobState extends State<ShowlistJob> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/addNewJob'),
        child: Icon(Icons.add),
      ),
      body: Text('Show list job'),
    );
  }
}
