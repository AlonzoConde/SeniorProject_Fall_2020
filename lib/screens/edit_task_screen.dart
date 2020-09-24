import 'package:flutter/cupertino.dart';
import 'package:project_senior/models/task.dart';

import 'package:flutter/material.dart';
import 'package:project_senior/screens/home_screen.dart';
import 'package:flutter/material.dart';

class EditTaskScreen extends StatefulWidget {
  EditTaskScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _EditTaskScreen createState() => _EditTaskScreen();
}

class _EditTaskScreen extends State<EditTaskScreen> {
  // int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Edit Task"),
            centerTitle: true,
            backgroundColor: Colors.grey,
            automaticallyImplyLeading: true,
            leading: IconButton(
              key: Key("back-button"),
              icon: Icon(Icons.arrow_back_ios),
              // color: color,
              onPressed: () {},
            )),
        body: Center(
            child: SingleChildScrollView(
                child:
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Row(
            children: [
              Text("Task Name"),
              IconButton(
                  icon: Icon(Icons.edit), iconSize: 20, onPressed: () async {}),
            ],
          ),
          Text("Task Progress"),
          Container(
            margin: EdgeInsets.all(70.0),
            //color: Colors.blue,
            width: 400,
            height: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                border: Border.all(
                  color: Colors.black,
                  width: 3,
                )),

            child: Column(
              children: [
                Text("Task Name"),
                SizedBox(
                  height: 25,
                ),
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      top: BorderSide(
                                        width: 3,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  ////////////////////////////////////////
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text("Progress"),
                                              IconButton(
                                                  icon: Icon(Icons.edit),
                                                  iconSize: 20,
                                                  onPressed: () async {}),
                                            ],
                                          ),
                                          Container(
                                            child: Text("Upcoming//"),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      ),
                      VerticalDivider(
                        color: Colors.black,
                        thickness: 3.0,
                        width: 0,
                      ),
                      Expanded(
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                width: 3,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text("Date"),
                                  IconButton(
                                      icon: Icon(Icons.edit),
                                      iconSize: 20,
                                      onPressed: () async {}),
                                ],
                              ),
                              Container(
                                child: Text("Upcoming//"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(
                      width: 3,
                      color: Colors.black,
                    ))),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Task Description (Optional)"),
                            IconButton(
                                icon: Icon(Icons.edit),
                                iconSize: 20,
                                onPressed: () async {}),
                          ],
                        ),
                        Container(
                          child: Text("Actual Desccription of the Task"),
                        ),
                      ],
                    )),
              ], //////
            ),
          ),
          Container(
            color: Colors.grey,
            child: Column(children: [
              new ListTile(
                  leading: new Icon(Icons.edit),
                  title: new Text('Edit Task Details'),
                  onTap: () => {}),
              new ListTile(
                leading: new Icon(Icons.archive),
                title: new Text('Archive Task'),
                onTap: () => {},
              ),
              new ListTile(
                leading: new Icon(
                  Icons.delete,
                ),
                title: new Text('Delete Task'),
                onTap: () => {},
              ),
            ]),
          ),
        ]))),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              title: Text('Teams'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Account'),
            ),
          ],
          //currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          //onTap: _onItemTapped,
        ));
  }
}
