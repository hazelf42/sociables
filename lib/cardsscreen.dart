import 'package:flutter/material.dart';
import 'package:sociables/storedrulelist.dart';

import 'businesslogicbaby.dart';
import 'models.dart';

class CardsScreen extends StatefulWidget {
  final PlayerSet playerSet;
  final RuleSet ruleSet;
  final cards = shuffle();
  CardsScreen({this.playerSet, this.ruleSet});

  @override
  _CardsScreenState createState() => _CardsScreenState(cards, playerSet);
}

class _CardsScreenState extends State<CardsScreen> {
  final cards;
  final PlayerSet playerSet;
  _CardsScreenState(this.cards, this.playerSet);
  var index = 0;
  Widget build(BuildContext context) {
    List<Player> playerList = playerSet.playerList;
    var player = playerList[index % playerList.length];
    var rule = getRule(cards[index].cardType, classicRuleList);
    if (rule.persists == true) {
      rule.assignedPlayer = player;
      if (rule.assignedPlayer != null) {
        //Remove rule from the previous player it was assigned to
        playerList[playerList.indexOf(rule.assignedPlayer)]
            .rulesApplied
            .remove(rule);
      }
      player.rulesApplied.add(rule);
    }
    return Scaffold(
        appBar: AppBar(
          title: Text("Sociables"),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.person_add, color: Colors.white),
                onPressed: () => Navigator.of(context).pop())
          ],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("lib/assets/felt background.jpg"),
                  fit: BoxFit.cover)),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(5),
                child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                        shape: BoxShape.circle),
                    child: Text(
                      "${player.emoji}",
                      style: Theme.of(context).textTheme.display2,
                      textAlign: TextAlign.center,
                    )),
              ),
              Text(
                "${player.name}" +
                    (player.rulesApplied != []
                        ? getRulesAppliedString(player)
                        : ""),
                style: Theme.of(context).textTheme.display2,
                textAlign: TextAlign.center,
              ),
              Expanded(
                child: FlatButton(
                    child: _suitToImage(cards[index]),
                    onPressed: () {
                      setState(() {
                        index = index + 1;
                      });
                    }),
              ),
              Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(width: 40),
                  Text(
                    rule.ruleTitle ?? "Rule not found",
                    style: Theme.of(context).textTheme.display1,
                  ),
                  IconButton(
                    icon: Icon(Icons.help, color: Colors.white),
                    onPressed: () async {
                      await showRuleDialog(rule);
                    },
                  )
                ],
              ),
            ],
          ),
        ));
  }

  Widget _suitToImage(PlayingCard card) {
    var suitInitial = card.cardSuit.toString().substring(9)[0].toUpperCase();
    var cardTypeSubstring = card.cardType.toString().substring(9);
    var cardType;
    if (numbers.contains(cardTypeSubstring)) {
      cardType = numbers.indexOf(cardTypeSubstring);
    } else {
      cardType = others[cardTypeSubstring];
    }
    return Container(
        padding: EdgeInsets.all(5),
        child: Image.asset("lib/assets/$cardType$suitInitial.png",
            fit: BoxFit.contain));
  }

  Future<void> showRuleDialog(Rule rule) async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(rule.ruleTitle),
            content: Text(rule.ruleText),
            actions: <Widget>[
              FlatButton(
                child: Text("OK"),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        });
  }

  String getRulesAppliedString(Player player) {
    var stringList = [];
    player.rulesApplied.forEach((rule) {
      stringList.add(rule.emoji);
    });
    return stringList.join(" ");
  }
}
