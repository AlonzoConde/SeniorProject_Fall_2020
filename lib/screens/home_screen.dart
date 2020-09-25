import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:project_senior/models/task.dart';

import 'package:project_senior/screens/add_task_screen.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:project_senior/screens/search_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  List<Task> listOfTasks;

  //This should be modified to take in a HangmanGame
  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
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
  List data = [];

  void fetchData() async {
    final response = await http
        .get('https://paradisial-pointers.000webhostapp.com/fetch_data.php');

    if (response.statusCode == 200) {
      setState(() {
        data = json.decode(response.body);
      });
    }
  }

  @override
  void initState() {
    getData();
    fetchData();
    super.initState();
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
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchScreen()),
                )
              },
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(5, 90, 0, 40),
            ),
            IconButton(
              icon: Icon(Icons.add_circle_outline),
              iconSize: 40,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddTaskScreen()),
                );
                // Task t = Task(y.name, y.date, y.location, y.assignedTo,
                //     y.description, "Upcoming");

                // print(y.name);
                // //add it to the list of tasks
                // listOfTasks.add(t);
                // setState(() {});
                print(data.length);
              },
            ),
          ]),
          Expanded(
            child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Slidable(
                      actionPane: SlidableDrawerActionPane(),
                      actionExtentRatio: 0.25,
                      actions: <Widget>[],
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
                          //onTap: () {},
                          onTap: () {
                            setState(() {
                              var url =
                                  'https://paradisial-pointers.000webhostapp.com/remove_data.php';
                              http.post(url, body: {
                                'id': data[index]['id'],
                              });
                            });
                          },
                          //onTap: () => _showSnackBar('Delete'),
                        ),
                      ],
                      child: ListTile(
                        key: Key(data[index]['name']),
                        title: Text(data[index]['name']),
                        subtitle: Text(data[index]['date']),
                        trailing: IconButton(
                          icon: Icon(Icons.brightness_1),
                          color: Colors.red,
                          onPressed: () {},
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

  Future getData() async {
    var url = 'https://paradisial-pointers.000webhostapp.com/fetch_data.php';
    http.Response response = await http.get(url);
    var d = jsonDecode(response.body);
    print(d.toString());
  }
}
