import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:project_senior/models/task.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:project_senior/screens/home_screen.dart';

import 'edit_task_screen.dart';
//import 'package:project_senior/screens/recommended_screen.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key key, this.title}) : super(key: key);

  final String title;
  // SearchScreen(this.listOfTasks);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  //List<Task> listOfTasks;

  goBackToHome(BuildContext context) {
    Navigator.pop(context);
    //MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  List data = [];
  Color _progressColor = Colors.red;

  void _settingModalBottomSheet(context, List<dynamic> d, int index) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.brightness_1, color: Colors.red),
                    title: new Text('Upcoming'),
                    onTap: () => {
                          http.post(
                              'https://paradisial-pointers.000webhostapp.com/update_data.php',
                              body: {
                                'progress': 'Upcoming',
                                'id': d[index]['id'],
                              })
                        }),
                new ListTile(
                  leading: new Icon(Icons.brightness_1, color: Colors.yellow),
                  title: new Text('In Progress'),
                  onTap: () => {
                    http.post(
                        'https://paradisial-pointers.000webhostapp.com/update_data.php',
                        body: {
                          'progress': 'In Progress',
                          'id': d[index]['id'],
                        })
                  },
                ),
                new ListTile(
                  leading: new Icon(
                    Icons.brightness_1,
                    color: Colors.green,
                  ),
                  title: new Text('Completed'),
                  onTap: () => {
                    http.post(
                        'https://paradisial-pointers.000webhostapp.com/update_data.php',
                        body: {
                          'progress': 'Completed',
                          'id': d[index]['id'],
                        }),
                  },
                ),
              ],
            ),
          );
        });
  }

  void fetchData() async {
    final response = await http
        .get('https://paradisial-pointers.000webhostapp.com/fetch_data.php');

    if (response.statusCode == 200) {
      setState(() {
        data = json.decode(response.body);
      });
    }
  }

  Future getData() async {
    var url = 'https://paradisial-pointers.000webhostapp.com/fetch_data.php';
    http.Response response = await http.get(url);
    var d = jsonDecode(response.body);
    print(d.toString());
  }

  @override
  void initState() {
    getData();
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const color = const Color(0xFF4C748B);

    return Scaffold(
        appBar: AppBar(
            title: TextField(
              decoration: InputDecoration(
                  hintText: 'Search', prefixIcon: Icon(Icons.search)),
            ),
            centerTitle: true,
            backgroundColor: Colors.grey,
            automaticallyImplyLeading: true,
            leading: IconButton(
              key: Key("back-button"),
              icon: Icon(Icons.arrow_back_ios),
              color: color,
              onPressed: () {
                goBackToHome(context);
              },
            )),
        body: Center(
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
              Text("HELLLOOOO"),
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
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             EditTaskScreen(data[index]['id'])));
                              },
                            ),
                            IconSlideAction(
                              caption: 'Archive',
                              color: Colors.blueGrey,
                              icon: Icons.archive,
                              onTap: () {
                                http.post(
                                    'https://paradisial-pointers.000webhostapp.com/update_data.php',
                                    body: {
                                      'progress': 'Completed',
                                      'id': data[index]['id'],
                                    });
                              },
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
                                  data.removeAt(index);
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
                              color: _progressColor,
                              onPressed: () {
                                _settingModalBottomSheet(context, data, index);
                                setState(() {
                                  if (data[index]['progress'] == 'Upcoming') {
                                    _progressColor = Colors.red;
                                  } else if (data[index]['progress'] ==
                                      'In Progress') {
                                    _progressColor = Colors.yellow;
                                  } else {
                                    _progressColor = Colors.green;
                                  }
                                });
                              },
                            ),
                          ));
                    }),
              )
            ]))));
  }
}
