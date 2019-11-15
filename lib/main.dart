import 'package:flutter/material.dart';
import 'package:sociables/playerlist.dart';
import 'package:sociables/storedrulelist.dart';

import 'businesslogicbaby.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
              display1: TextStyle(fontSize: 28, color: Colors.white),
              display2: TextStyle(fontSize: 21, color: Colors.white))),
      home: PlayersList(),
    );
  }
}
