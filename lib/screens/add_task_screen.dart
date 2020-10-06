import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:project_senior/models/task.dart';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:project_senior/screens/home_screen.dart';
//import 'package:project_senior/screens/recommended_screen.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController taskName = TextEditingController();
  TextEditingController taskTime = TextEditingController();
  TextEditingController taskAssignedTo = TextEditingController();
  TextEditingController taskDescription = TextEditingController();
  TextEditingController taskLocation = TextEditingController();
  TextEditingController taskColor = TextEditingController();

  //TextEditingController taskProgress = TextEditingController();

  Future<List> senddata() async {
    final response = await http.post(
        "https://paradisial-pointers.000webhostapp.com/insertdata.php",
        body: {
          "name": taskName.text,
          "location": taskLocation.text,
          "description": taskDescription.text,
          "date": taskTime.text,
          "progress": "Upcoming",
          "assignedTo": taskAssignedTo.text,
        });
  }

  Task createdTask = new Task("", "", "", "", "", "");

  getItemAndNavigate(BuildContext context) {
    Navigator.pop(context);
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
            title: Text("Add New Task"),
            centerTitle: true,
            backgroundColor: Colors.grey,
            automaticallyImplyLeading: true,
            leading: IconButton(
              key: Key("back-button"),
              icon: Icon(Icons.arrow_back_ios),
              color: color,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
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
                  key: Key("continue-button"),
                  child: Text(
                    "Add Task",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  onPressed: () => {
                    senddata(),
                    getData(),
                    getItemAndNavigate(context),
                  },
                  color: color,
                ))
          ])),
        ));
  }

  Future getData() async {
    var url = 'https://paradisial-pointers.000webhostapp.com/fetch_data.php';
    http.Response response = await http.get(url);
    var d = jsonDecode(response.body);
    print(d.toString());
  }
}
