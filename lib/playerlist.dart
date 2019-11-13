import 'package:flutter/material.dart';
import 'businesslogicbaby.dart';

class PlayersList extends StatefulWidget {
  PlayersList({Key key}) : super(key: key);

  @override
  PlayersListState createState() => PlayersListState();
}

class PlayersListState extends State<PlayersList> {
  List<Player> playersList = [
    Player(emoji: "a", name: "Player 1"),
    Player(emoji: "b", name: "Player 2"),
    Player(emoji: "c", name: "Player 3"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Players"),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              TextField(onChanged: (playerName) {
                //Show addemoji screen
                _addPlayer(playerName);
              }),
              _buildList(context, playersList),
            ],
          ),
        ));
  }

  Widget _buildList(context, playersList) {
    return ListView.builder(itemBuilder: playersList.forEach((Player player) {
      return _playerCard(player);
    }));
  }

  Widget _playerCard(Player player) {
    return Container(
        child: Card(
      child: Wrap(
        children: <Widget>[
          Text(player.emoji ?? ""),
          Text(player.name),
        ],
      ),
    ));
  }

  void _addPlayer(String playerName) {
    setState(() {
      playersList.add(Player(name: playerName));
    });
  }
}
