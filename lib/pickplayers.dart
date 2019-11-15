import 'package:flutter/material.dart';

import 'businesslogicbaby.dart';

class PickPlayers extends StatelessWidget {
  final List<PlayerSet> playerSetList;
  PickPlayers({this.playerSetList});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: playerSetList.length + 1,
        itemBuilder: (BuildContext context, int index) {
        return index == playerSetList.length ? 
        playerSetCard(playerSetList[index], context) : 
        addPlayerSetCard(context);
       },
      ),
    );
  }
  Widget playerSetCard(PlayerSet playerSet, BuildContext context) {
    return Card(child: Container(
      child: Column(
        children: <Widget>[
          FlatButton(child: Text(playerSet.setName), 
          onPressed: () {}),
        ],
      ),
    ),);
  } 
   Widget addPlayerSetCard(BuildContext context) {
    return Card(child: Container(
      child: Column(
        children: <Widget>[
          FlatButton(child: Text("Add a Player List."), 
          onPressed: () {})
        ],
      ),
    ),);
  } 
}