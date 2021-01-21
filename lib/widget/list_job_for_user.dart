import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:windaicapp/models/job_model.dart';
import 'package:windaicapp/utility/myconstant.dart';
import 'package:windaicapp/utility/mystyle.dart';

class ListJobForUser extends StatefulWidget {
  @override
  _ListJobForUserState createState() => _ListJobForUserState();
}

class _ListJobForUserState extends State<ListJobForUser> {
  List<JobModel> jobModels = <JobModel>[];

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
    String iduser = preferences.getString('id');

    String path =
        '${MyConstant().domain}/aic/getJobUserWhereId.php?isAdd=true&iduser=$iduser';

    await Dio().get(path).then((value) {
      for (var item in json.decode(value.data)) {
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
      body: jobModels.length == 0
          ? Mystyle().showProgress()
          : ListView.builder(
              itemCount: jobModels.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  print('You Click index = $index');
                  confirimDialog(jobModels[index]);
                },
                child: Card(
                  color: index % 2 == 0 ? Colors.grey.shade300 : Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
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
                            Text(jobModels[index].nameofficer),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  Future<Null> confirimDialog(JobModel jobModel) async {
    showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              title: ListTile(
                leading: Image.asset('images/logo.png'),
                title: Text(jobModel.title),
                subtitle: Text('ToDo: ${jobModel.todo}'),
              ),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Officer => ${jobModel.nameofficer}'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('status => ${jobModel.status}'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        editData('Accept', jobModel);
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Accept',
                        style: Mystyle().colortStyle(Colors.green.shade700),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        editData('reject', jobModel);
                        Navigator.pop(context);
                      },
                      child: Text('Reject',
                          style: Mystyle().colortStyle(Colors.red.shade700)),
                    ),
                    TextButton(
                      onPressed: () {
                        editData('Success', jobModel);
                        Navigator.pop(context);
                      },
                      child: Text('Success',
                          style: Mystyle().colortStyle(Colors.blue.shade700)),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancel',
                          style: Mystyle().colortStyle(Colors.yellow.shade700)),
                    ),
                  ],
                )
              ],
            ));
  }

  Future<Null> editData(String string, JobModel model) async {
    String status = string;
    String id = model.id;
    String path =
        '${MyConstant().domain}/aic/editJobWhereId.php?isAdd=true&id=$id&status=$status';
    Dio().get(path).then((value) => readData());
  }
}
