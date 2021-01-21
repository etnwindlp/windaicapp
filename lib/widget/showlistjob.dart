import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:windaicapp/models/job_model.dart';
import 'package:windaicapp/utility/myconstant.dart';
import 'package:windaicapp/utility/mystyle.dart';

class ShowlistJob extends StatefulWidget {
  @override
  _ShowlistJobState createState() => _ShowlistJobState();
}

class _ShowlistJobState extends State<ShowlistJob> {
  List<JobModel> jobModels = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readData();
  }

  Future<Null> readData() async {
    if (jobModels.length != 0) {
      jobModels.clear();
    }

    SharedPreferences preferences = await SharedPreferences.getInstance();
    String idofficer = preferences.getString('id');

    String path =
        '${MyConstant().domain}/aic/getJobOfficerWhereId.php?isAdd=true&idofficer=$idofficer';
    await Dio().get(path).then((value) {
      var result = json.decode(value.data);
      for (var item in result) {
        JobModel model = JobModel.fromMap(item);
        setState(() {
          jobModels.add(model);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/addNewJob')
            .then((value) => readData()),
        child: Icon(Icons.add),
      ),
      body: jobModels.length == 0
          ? Mystyle().showProgress()
          : ListView.builder(
              itemCount: jobModels.length,
              itemBuilder: (context, index) => Card(
                color: index % 2 == 0 ? Colors.grey.shade300 : Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            jobModels[index].title,
                            style: Mystyle().titleStyle(),
                          ),
                          Text(
                            jobModels[index].status,
                            style: Mystyle().contentStyle(),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(jobModels[index].todo),
                          Text(jobModels[index].nameuser),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
