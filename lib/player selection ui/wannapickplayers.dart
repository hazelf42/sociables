import 'package:flutter/material.dart';
import 'package:sociables/player%20selection%20ui/playerlist.dart';

import '../cardsscreen.dart';
import '../models.dart';


class WannaPickPlayers extends StatelessWidget {
  RuleSet ruleSet;
  WannaPickPlayers({this.ruleSet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Add a player list?")),
        body: Container(
            child: Column(children: <Widget>[
          FlatButton(
              child: Text("Yep, let's add players!"),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PlayersList()));
              }),
          FlatButton(
            child: Text("No thanks, we'll (try to) keep track"),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CardsScreen(ruleSet: ruleSet)));
            },
          )
        ])));
  }
}
