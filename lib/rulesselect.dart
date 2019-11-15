import 'package:flutter/material.dart';
import 'package:sociables/playerlist.dart';
import 'package:sociables/storedrulelist.dart';

import 'businesslogicbaby.dart';

class RulesSelectScreen extends StatelessWidget {
  // const RulesSelectScreen({});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: listOfRuleSets.length,
        itemBuilder: (BuildContext context, int index) {
        return _ruleSetCard(listOfRuleSets[index], context);
       },
      )
    );
  }
  Widget _ruleSetCard(RuleSet ruleSet, BuildContext context){
    return FlatButton(child:Card(child: 
    Container(child: Column(children: <Widget>[
      Text(ruleSet.title),
      Text(ruleSet.description)
    ]
    )
    )
    ),
    onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            PlayersList(ruleSet: ruleSet))),
    );
  }
}