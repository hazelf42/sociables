import 'package:flutter/material.dart';
import 'package:sociables/player%20selection%20ui/pickplayers.dart';
import 'package:sociables/player%20selection%20ui/wannapickplayers.dart';

import 'businesslogicbaby.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models.dart';

void main() async {
  final prefs = await SharedPreferences.getInstance();

  var playerSets = getStoredPlayerSets(prefs);
  
  if (playerSets == null || playerSets == []) {
    runApp(NewUserApp());
  } else {
    runApp(MyApp(playerSets));
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final List<PlayerSet> playerSets;
  MyApp(this.playerSets);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          textTheme: TextTheme(
              display1: TextStyle(fontSize: 28, color: Colors.white),
              display2: TextStyle(fontSize: 21, color: Colors.white),
              subtitle: TextStyle(fontSize: 18, color: Colors.red)
              )),
      home: PickPlayers(playerSets: playerSets),
    );
  }
}

class NewUserApp extends StatelessWidget {
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
      home: WannaPickPlayers(),
    );
  }
}
