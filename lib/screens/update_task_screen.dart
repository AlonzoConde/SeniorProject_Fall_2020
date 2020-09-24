import 'package:flutter/cupertino.dart';
import 'package:project_senior/models/task.dart';

import 'package:flutter/material.dart';
import 'package:project_senior/screens/home_screen.dart';
import 'package:flutter/material.dart';

class UpdateTaskScreen extends StatefulWidget {
  UpdateTaskScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _UpdateTaskScreen createState() => _UpdateTaskScreen();
}

class Task {
  String name;
  String location;
  String description;
  String date;
  String progress;
  String assignedTo;

  Task(this.name, this.date, this.description, this.location, this.assignedTo,
      this.progress);
}

class _UpdateTaskScreen extends State<UpdateTaskScreen> {
  TextEditingController taskName = TextEditingController();
  TextEditingController taskTime = TextEditingController();
  TextEditingController taskAssignedTo = TextEditingController();
  TextEditingController taskDescription = TextEditingController();
  TextEditingController taskLocation = TextEditingController();
  //TextEditingController taskProgress = TextEditingController();

  Task createdTask = new Task("", "", "", "", "", "");

  getItemAndNavigate(BuildContext context) {
    createdTask.name = taskName.text;
    createdTask.date = taskTime.text;
    createdTask.assignedTo = taskAssignedTo.text;
    createdTask.description = taskDescription.text;
    createdTask.location = taskLocation.text;
    //createdTask.progress = taskName.text;

    Navigator.pop(context, createdTask);
    //MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    const color = const Color(0xFF4C748B);
    // if (_enabled) {
    //   _onPressed = () {
    //     // widget.calc(cups);
    //     Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //             builder: (context) => RecommendedScreen(coffee, water, which)));
    //   };
    // }

    return Scaffold(
        appBar: AppBar(
            title: Text("Edit Task"),
            centerTitle: true,
            backgroundColor: Colors.grey,
            automaticallyImplyLeading: true,
            leading: IconButton(
              key: Key("back-button"),
              icon: Icon(Icons.arrow_back_ios),
              color: color,
              onPressed: () {},
            )),
        body: Center(
          child: SingleChildScrollView(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            TextField(
                controller: taskName,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  labelText: 'Name',
                )),
            Padding(padding: EdgeInsets.all(16.0)),
            TextField(
                controller: taskTime,
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  labelText: 'Time',
                )),
            Padding(padding: EdgeInsets.all(16.0)),
            TextField(
                controller: taskLocation,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  labelText: 'Location',
                )),
            Padding(padding: EdgeInsets.all(16.0)),
            TextField(
                controller: taskAssignedTo,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  labelText: 'Assigned To (Optional)',
                )),
            Padding(padding: EdgeInsets.all(16.0)),
            TextField(
                controller: taskDescription,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  labelText: 'Description (Optional)',
                )),
            Padding(padding: EdgeInsets.all(16.0)),
            ButtonTheme(
                minWidth: 300.0,
                height: 50.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                  key: Key("submit-button"),
                  child: Text(
                    "Submit",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  onPressed: () => getItemAndNavigate(context),
                  color: color,
                ))
          ])),
        ));
  }
}
