import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:project_senior/models/task.dart';

import 'package:flutter/material.dart';
import 'package:project_senior/screens/add_task_screen.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  List<Task> listOfTasks;

  //This should be modified to take in a HangmanGame
  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

void saveToFileSystem() {
//String serialized = jsonEncode(tasks);
}

void _settingModalBottomSheet(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          child: new Wrap(
            children: <Widget>[
              new ListTile(
                  leading: new Icon(Icons.brightness_1, color: Colors.red),
                  title: new Text('Upcoming'),
                  onTap: () => {}),
              new ListTile(
                leading: new Icon(Icons.brightness_1, color: Colors.yellow),
                title: new Text('In Progress'),
                onTap: () => {},
              ),
              new ListTile(
                leading: new Icon(
                  Icons.brightness_1,
                  color: Colors.green,
                ),
                title: new Text('Completed'),
                onTap: () => {},
              ),
            ],
          ),
        );
      });
}

List<Task> deserializeJSONTaskList(String json) {
  print(jsonDecode(json));
  List listOfMaps = jsonDecode(json);

  List listOfTasks = [];
  listOfMaps.forEach((map) {
    Task tmp = Task.fromJson(map);
    print(tmp.name);
    listOfTasks.add(tmp);
  });

  return listOfTasks;
}

// String(Task x) {
//   var response = "";
//   if (x.progress == "Upcoming") {
//     response
//   } else if (x.progress == "In Progess") {

//   } else {

//   }
//   return response;
// }

void loadFromFileSystem() {}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> listOfTasks;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listOfTasks = [];
    loadFromFileSystem();

    //tasks = deserializeJSONTaskList(serialized);
  }

  @override
  Widget build(BuildContext context) {
    // if button == true
    // if (addTaskButton) {
    //   __addTaskButton = () {
    //     //dripFrench = true;
    //     Navigator.push(
    //         context, MaterialPageRoute(builder: (context) => AddTaskScreen()));
    //   };
    // } else if (searchButton) {
    //   _searchButton = () {
    //     //dripFrench = false;
    //     Navigator.push(
    //         context, MaterialPageRoute(builder: (context) => AddTaskScreen()));
    //   };
    // } else if (searchButton && addTaskButton) {
    //   __addTaskButton = null;
    // }
    const color = const Color(0xFF4C748B);

    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Padding(
              padding: EdgeInsets.fromLTRB(1, 90, 20, 40),
            ),
            Text(
              "Home",
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 30,
                color: color,
              ),
              key: Key('home-screen'),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(190, 90, 0, 40),
            ),
            IconButton(
              icon: Icon(Icons.search),
              iconSize: 40,
              onPressed: () => {},
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(5, 90, 0, 40),
            ),
            IconButton(
              icon: Icon(Icons.add_circle_outline),
              iconSize: 40,
              onPressed: () async {
                Task y = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddTaskScreen()),
                );

                Task t = Task(y.name, y.date, y.location, y.assignedTo,
                    y.description, "Upcoming");

                print(y.name);

                //add it to the list of tasks
                listOfTasks.add(t);
                print(listOfTasks[0].name);
                setState(() {});

                saveToFileSystem();
              },
            ),
          ]),
          Expanded(
            child: ListView.builder(
                itemCount: listOfTasks.length,
                itemBuilder: (context, index) {
                  return Slidable(
                      actionPane: SlidableDrawerActionPane(),
                      actionExtentRatio: 0.25,
                      actions: <Widget>[
                        IconSlideAction(
                          caption: 'Archive',
                          color: Colors.blue,
                          icon: Icons.archive,
                          //onTap: () => _showSnackBar('Archive'),
                        ),
                        IconSlideAction(
                          caption: 'Share',
                          color: Colors.indigo,
                          icon: Icons.share,
                          //onTap: () => _showSnackBar('Share'),
                        ),
                      ],
                      secondaryActions: <Widget>[
                        IconSlideAction(
                          caption: 'More',
                          color: Colors.black45,
                          icon: Icons.more_horiz,
                          onTap: () {},
                          //onTap: () => SnackBar(content: Text('More')),
                        ),
                        IconSlideAction(
                          caption: 'Archive',
                          color: Colors.blueGrey,
                          icon: Icons.archive,
                          onTap: () {},
                          //onTap: () => _showSnackBar('Delete'),
                        ),
                        IconSlideAction(
                          caption: 'Delete',
                          color: Colors.red,
                          icon: Icons.delete,
                          onTap: () {},
                          //onTap: () => _showSnackBar('Delete'),
                        ),
                      ],
                      child: ListTile(
                        key: Key(listOfTasks[index].name),
                        // onDismissed: (direction) {
                        //   setState(() {
                        //     listOfTasks.removeAt(index);
                        //   });
                        //   Scaffold.of(context).showSnackBar(SnackBar(
                        //       content: Text(
                        //           "${listOfTasks[index].name} dismissed")));
                        // },
                        // background: Container(color: Colors.red),
                        // child: CheckboxListTile(
                        //   title: Text(listOfTasks[index].name),
                        //   value: false,
                        //   onChanged: (bool b) {
                        //     //listOfTasks[index].completed = b;
                        //     setState(() {});
                        //   },
                        // ))

                        title: Text(listOfTasks[index].name),
                        subtitle: Text(listOfTasks[index].date),
                        trailing: IconButton(
                          icon: Icon(Icons.brightness_1),
                          color: Colors.red,
                          onPressed: () {
                            _settingModalBottomSheet(context);
                          },
                        ),
                      ));
                }),
          ),
          Container(
            height: 60,
            decoration: BoxDecoration(
                border: Border(
              top: BorderSide(width: 2, color: Colors.black),
              bottom: BorderSide(width: 2, color: Colors.black),
            )),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: BottomNavigationBar(items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    title: Text("Home"),
                    backgroundColor: Colors.grey,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.people),
                    title: Text("Teams"),
                    backgroundColor: Colors.grey,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    title: Text("Person"),
                    backgroundColor: Colors.grey,
                  ),
                ])),
          )
        ],
      ),
    ));
  }
}
