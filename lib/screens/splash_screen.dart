import 'package:flutter/material.dart';
import 'dart:async';

import 'package:project_senior/screens/home_screen.dart';
import 'package:project_senior/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = new Duration(seconds: 3);
    return new Timer(duration, navigateToDeviceScreen);
  }

  navigateToDeviceScreen() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "Task App",
              key: Key('homebrew-text'),
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white, fontFamily: 'RobotoMono', fontSize: 48),
            ),
          ),
          Center(
              child: Text(
            "Still in Development :/",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'RobotoMono', color: Colors.white, fontSize: 22),
          )),
        ],
      )),
    );
  }
}
