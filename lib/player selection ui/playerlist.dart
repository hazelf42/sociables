import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sociables/rulesselect.dart';
import 'package:emoji_picker/emoji_picker.dart';

import '../businesslogicbaby.dart';
import '../cardsscreen.dart';
import '../models.dart';

class PlayersList extends StatefulWidget {
  PlayersList({this.playerSetsIndex, this.playerSets});

  int playerSetsIndex;
  List<PlayerSet> playerSets;
  String setName;

  @override
  PlayersListState createState() =>
      PlayersListState(playerSetsIndex, playerSets);
}

class PlayersListState extends State<PlayersList> {
  //SetState
  List<PlayerSet> playerSets;
  int playerSetsIndex;
  String setName;
  PlayersListState(this.playerSetsIndex, this.playerSets);
  List<Player> playerList;

  //Ui stuff
  int editingIndex;
  final TextEditingController _controller = new TextEditingController();
  var isShowing = false;
  var editingName = false;

  //Player stuff
  String newPlayerName = "";
  Emoji emojiSelected = Emoji(emoji: "😃", name: "default smile");
  @override
  void initState() {
    super.initState();

    if (playerSetsIndex == null) {
      if (playerSets != null) {
        playerSetsIndex = playerSets.length;
      }
      playerList = [];
    } else {
      playerList = playerSets[playerSetsIndex].playerList;
    }
  }

  @override
  Widget build(BuildContext context) {
    print(playerSets);
    return Scaffold(
        appBar: AppBar(
          title: Container(
            child: editingName == true
                ? SizedBox(
                    width: 150,
                    child: TextField(
                      onSubmitted: (name) {
                        setState(() {
                          setName = name;
                          editingName = false;
                        });
                      },
                    ))
                : FlatButton(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.edit),
                        Expanded(
                            child: Text(setName ?? "Player List 1",
                                style: setName == null
                                    ? TextStyle(
                                        color: Colors.white54,
                                        decoration: TextDecoration.underline)
                                    : TextStyle())),
                      ],
                    ),
                    onPressed: () {
                      setState(() {
                        editingName = true;
                      });
                    }),
          ),
          actions: editingName == true
              ? <Widget>[
                  IconButton(
                    icon: Icon(Icons.cancel),
                    onPressed: () {
                      setState(() {
                        editingName = false;
                      });
                    },
                  ),
                ]
              : <Widget>[
                  IconButton(
                      icon: Icon(Icons.done, color: Colors.white),
                      onPressed: () async {
                        if (playerList == null || playerList.length == 0) {
                          return;
                        }
                        var playerSet =
                            PlayerSet(playerList: playerList, setName: setName);
                        if (playerSetsIndex == null && playerSets != null) {
                          print("1");
                          playerSets.add(playerSet);
                        } else if (playerSets == null) {
                          print("2");
                          playerSets = [playerSet];
                        } else {
                          print("3");
                          playerSets[playerSetsIndex] = playerSet;
                        }
                        print(
                            "VSCode debugging breakpoitns stopped working lol");
                        await (SharedPreferences.getInstance().then((prefs) {
                          print("4");
                          persistPlayerSet(
                            playerSets,
                            prefs,
                          );
                        }))
                            .then((_) {
                          print("5");

                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  RulesSelectScreen(playerSet: playerSet)));
                        });
                      }),
                  IconButton(
                    icon: Icon(Icons.delete_forever),
                    onPressed: () async {
                      await showClearDialog();
                    },
                  )
                ],
        ),
        body: Container(
          padding: EdgeInsets.all(5),
          child: Column(
            children: <Widget>[
              editingIndex == null
                  ? Padding(
                      padding: EdgeInsets.all(5),
                      child: _addPlayerField(context))
                  : Container(),
              Expanded(child: _buildList(context, playerList)),
            ],
          ),
        ));
  }

  Widget _buildList(context, playerList) {
    if (playerList != null && playerList.length > 0) {
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
          Expanded(child: Text(player.name, style: TextStyle(fontSize: 24))),
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
    _controller.dispose();
    super.dispose();
  }
}
