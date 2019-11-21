import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sociables/businesslogicbaby.dart';
import 'package:sociables/player%20selection%20ui/playerlist.dart';

import '../colors.dart';
import '../models.dart';

class PickPlayers extends StatefulWidget {
  final List<PlayerSet> playerSets;
  PickPlayers({this.playerSets});

  @override
  _PickPlayersState createState() => _PickPlayersState(playerSets: playerSets);
}

class _PickPlayersState extends State<PickPlayers> {
  final List<PlayerSet> playerSets;
  _PickPlayersState({this.playerSets});

  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
      appBar: AppBar(),
      body: 
    
     Container(
       height: MediaQuery.of(context).size.height,
       decoration: BoxDecoration(
         image: DecorationImage(image: AssetImage('lib/assets/brick-texture.jpg'), fit: BoxFit.cover)
       ),
      child: ListView.builder(
        itemCount: playerSets.length + 1,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: index != playerSets.length
                ? playerSetCard(playerSets[index], playerSets, context)
                : addPlayerSetCard(context),
          );
        },
      ),
    )
    );
  }

  Widget playerSetCard(
      PlayerSet playerSet, List<PlayerSet> playerSets, BuildContext context) {
        var index = playerSets.indexOf(playerSet);
        print(playerSets);
    return Card(
      elevation: 20,
      child: Container(
        height: 100,
        padding: EdgeInsets.symmetric(vertical: 10),
        color: AppColors.colorList[index%5],
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () async {
                    showClearDialog(context, index);
                  },
                ),
                FlatButton( 
                    child: 
                    Column(
                      crossAxisAlignment: 
                      CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                    Text(playerSet.setName ?? "Player Set ${index+1}", style: AppFonts.darkTitle),
                    Container(width: MediaQuery.of(context).size.width-120, child: playerSet.playerList.length > 3  ? Text("With ${playerSet.playerList[0].name}, ${playerSet.playerList[1].name}, ${playerSet.playerList[2].name}, and ${playerSet.playerList.length - 3 } more.")
                    : Text("With ${joinPlayers(playerSet.playerList)}."))
                    ],
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PlayersList( 
                              playerSets: playerSets,
                              playerSetsIndex: index)));
                    })
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget addPlayerSetCard(BuildContext context) {
    return Card(
      child: Container(
        color: AppColors.red,
        child: Column(
          children: <Widget>[
            FlatButton(
                child: Text("Add a Player List"),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => PlayersList(playerSets: playerSets)));
                })
          ],
        ),
      ),
    );
  }

  Future<void> showClearDialog(BuildContext context, int index) async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Clear Players"),
            content: Text("Sure you want to clear all players?"),
            actions: <Widget>[
              FlatButton(
                child: Text("Nevermind"),
                onPressed: () => Navigator.of(context).pop(),
              ),
              FlatButton(
                  child: Text("Cast them to the void"),
                  onPressed: () async {
                    setState(() {
                      playerSets.removeAt(index);
                      Navigator.of(context).pop();
                    });
                    await (SharedPreferences.getInstance().then((prefs) {
                      persistPlayerSet(
                        playerSets,
                        prefs,
                      );
                    }));
                  })
            ],
          );
        });
  }
  String joinPlayers(List<Player> playerList) { 
     var stringList = [];
     playerList.forEach((p) 
     {
       stringList.add(p.name);
     });
     return stringList.join(", ");
  }
}
