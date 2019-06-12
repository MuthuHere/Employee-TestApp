import 'dart:async';

import 'package:flutter/material.dart';
import 'package:silver_lake_app/ui/home/home_page.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => HomePage(),
      },
    ));

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<MyApp> {
  @override
  void initState() {
    _callTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        decoration: new BoxDecoration(color: Colors.lightBlueAccent),
      ),
    ));
  }

  _callTimer() async {
    var _duration = Duration(seconds: 4);
    return new Timer(_duration, _navigationToHome);
  }

  void _navigationToHome() {
    Navigator.pushReplacementNamed(context, "/home");
  }
}
