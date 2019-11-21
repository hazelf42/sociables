import 'package:flutter/material.dart';
import 'package:sociables/cardsscreen.dart';
import 'package:sociables/player%20selection%20ui/playerlist.dart';
import 'package:sociables/storedrulelist.dart';
import 'models.dart';

class RulesSelectScreen extends StatelessWidget {
  final PlayerSet playerSet;
  RulesSelectScreen({this.playerSet});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
      itemCount: listOfRuleSets.length,
      itemBuilder: (BuildContext context, int index) {
        return _ruleSetCard(listOfRuleSets[index], context);
      },
    ));
  }

  Widget _ruleSetCard(RuleSet ruleSet, BuildContext context) {
    return FlatButton(
      child: Card(
          child: Container(
              child: Column(children: <Widget>[
        Text(ruleSet.title),
        Text(ruleSet.description)
      ]))),
      onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CardsScreen(playerSet: playerSet))),
    );
  }
}
