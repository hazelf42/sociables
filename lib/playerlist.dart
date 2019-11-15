import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sociables/cardsscreen.dart';
import 'package:sociables/rulesselect.dart';
import 'businesslogicbaby.dart';
import 'package:emoji_picker/emoji_picker.dart';
import 'main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlayersList extends StatefulWidget {
  List<Player> playerList;
  RuleSet ruleSet;
  PlayersList({this.playerList, this.ruleSet});

  @override
  PlayersListState createState() => PlayersListState(playerList, ruleSet);
}

class PlayersListState extends State<PlayersList> {
  //SetState
  List<Player> playerList;
  RuleSet ruleSet;
  PlayersListState(this.playerList, this.ruleSet);

  //Ui stuff
  int editingIndex;
  final TextEditingController _controller = new TextEditingController();
  var isShowing = false;

  //Player stuff
  String newPlayerName = "";
  Emoji emojiSelected = Emoji(emoji: "😃", name: "default smile");

  //Other stuff
  SharedPreferences prefs;

  @override
  void initState() {
    asyncInitState();
    super.initState();
  }

  void asyncInitState() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      playerList = getStoredPlayerList(prefs);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Pick Your Player"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.done, color: Colors.white),
              onPressed: () => {
                if (playerList.length > 0)
                  {
                    persistPlayerList(playerList, prefs,
                        0), //TODO: Allow mutlple player lists
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            CardsScreen(playerList: playerList)))
                  }
              },
            ),
            IconButton(
              icon: Icon(Icons.delete_forever),
              onPressed: () async {
                await showClearDialog();
              },
            )
          ],
        ),
        body: playerList == null
            ? Container(child: Text("Loading saved players..."))
            : Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  children: <Widget>[
                    editingIndex == null
                        ? Padding(
                            padding: EdgeInsets.all(5),
                            child: _addPlayerField(context))
                        : Container(),
                    FlatButton(
                      child: Text("Pick Rules"),
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => RulesSelectScreen())),
                    ),
                    Expanded(child: _buildList(context, playerList)),
                  ],
                ),
              ));
  }

  Widget _buildList(context, playerList) {
    if (playerList.length > 0) {
      return ListView.builder(
          itemCount: playerList.length,
          itemBuilder: (context, index) {
            return (index == editingIndex)
                ? _editPlayerField(context, playerList[index])
                : _playerCard(playerList[index], index);
          });
    }
    return Container();
  }

  Widget _addPlayerField(context) {
    _controller.addListener(() {
      newPlayerName = _controller.text;
    });
    return Row(children: <Widget>[
      isShowing != false
          ? FittedBox(
              child: EmojiPicker(
              rows: 3,
              columns: 7,
              recommendKeywords: recommendedKeywords,
              numRecommended: 30,
              onEmojiSelected: (emoji, category) {
                emojiSelected = emoji;
                setState(() {
                  isShowing = false;
                });
              },
            ))
          : Container(
              width: 100,
              child: FlatButton(
                  child: Container(
                      child: Row(children: [
                    Text(emojiSelected.emoji ?? " 😃",
                        style: TextStyle(fontSize: 24),
                        textAlign: TextAlign.center),
                    Icon(Icons.arrow_drop_down)
                  ])),
                  onPressed: () {
                    setState(() {
                      isShowing = true;
                    });
                  })),
      Expanded(
          child: TextField(
        controller: _controller,
        onSubmitted: (_) {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        decoration: InputDecoration(
            labelText: "Player ${playerList.length + 1 ?? 1}",
            hintText: listOfNames[playerList.length % listOfNames.length]),
      )),
      IconButton(
          icon: Icon(Icons.done),
          color: Colors.green,
          onPressed: () => {
                setState(() {
                  playerList.add(Player(
                      name: newPlayerName != ""
                          ? newPlayerName
                          : listOfNames[playerList.length % listOfNames.length],
                      emoji: emojiSelected.emoji));
                }),
                emojiSelected = Emoji(emoji: "😃", name: "Default"),
                _controller.clear(),
              }),
      IconButton(
          icon: Icon(Icons.shuffle),
          color: Colors.grey,
          onPressed: () => {
                _controller.text =
                    listOfNames[Random().nextInt(listOfNames.length)]
              })
    ]);
  }

  Widget _editPlayerField(context, player) {
    _controller.text = player.name;
    _controller.addListener(() {
      player.name = _controller.text;
    });
    return Row(children: <Widget>[
      isShowing != false
          ? EmojiPicker(
              rows: 3,
              columns: 5,
              recommendKeywords: recommendedKeywords,
              numRecommended: 30,
              onEmojiSelected: (emoji, category) {
                emojiSelected = emoji;
                setState(() {
                  isShowing = false;
                });
              },
            )
          : Container(
              width: 100,
              child: FlatButton(
                  child: Container(
                      child: Row(children: [
                    Text(emojiSelected.emoji ?? " 😃",
                        style: TextStyle(fontSize: 24),
                        textAlign: TextAlign.center),
                    Icon(Icons.arrow_drop_down)
                  ])),
                  onPressed: () {
                    setState(() {
                      isShowing = true;
                    });
                  })),
      Expanded(
          child: TextField(
        controller: _controller,
        onSubmitted: (_) {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        decoration: InputDecoration(
            labelText: "Player ${playerList.length ?? 1}",
            hintText: player.name),
      )),
      IconButton(
        icon: Icon(Icons.done),
        color: Colors.green,
        onPressed: () => newPlayerName != ""
            ? {
                emojiSelected = Emoji(emoji: "😃", name: "Default"),
                setState(() {
                  playerList.add(
                      Player(name: newPlayerName, emoji: emojiSelected.emoji));
                }),
                _controller.clear(),
              }
            : null,
      ),
      IconButton(
          icon: Icon(Icons.delete),
          color: Colors.red,
          onPressed: () => {
                emojiSelected = Emoji(emoji: "😃", name: "Default"),
                setState(() {
                  playerList.remove(player);
                  editingIndex = null;
                }),
                _controller.clear(),
              })
    ]);
  }

  Widget _playerCard(Player player, int index) {
    return Card(
        child: Container(
      width: MediaQuery.of(context).size.width - 50,
      height: 75,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(player.emoji ?? "", style: TextStyle(fontSize: 30)),
          SizedBox(
            width: 20,
          ),
          Text(player.name, style: TextStyle(fontSize: 24)),
          SizedBox(width: 20),
          IconButton(
              icon: Icon(Icons.edit),
              onPressed: () => setState(() {
                    editingIndex = index;
                  }))
        ],
      ),
    ));
  }

  Future<void> showClearDialog() async {
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
                  onPressed: () {
                    setState(() {
                      playerList = [];
                      Navigator.of(context).pop();
                    });
                  })
            ],
          );
        });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }
}
