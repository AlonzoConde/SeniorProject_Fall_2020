import 'package:flutter/cupertino.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:project_senior/models/task.dart';

import 'package:flutter/material.dart';
import 'package:project_senior/screens/home_screen.dart';
//import 'package:project_senior/screens/recommended_screen.dart';

class SearchScreen extends StatefulWidget {
  // List<Task> listOfTasks;

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
                    children: []))));
  }
}
