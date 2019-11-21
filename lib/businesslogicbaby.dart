import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'models.dart';


List<PlayingCard> shuffle() {
  List<PlayingCard> deck = [];
  for (var type in CardType.values) {
    for (var suit in CardSuit.values) {
      deck.add(PlayingCard(cardSuit: suit, cardType: type));
    }
  }
  deck.shuffle();
  return deck;
}

Rule getRule(CardType card, List<Rule> ruleList) {
  Rule aRule;
  ruleList.forEach((rule) {
    if (rule.assignedCard == card) {
      aRule = rule;
    }
  });
  return aRule;
}


//Persistence stuff
List<PlayerSet> getStoredPlayerSets(SharedPreferences prefs) {
  List<PlayerSet> playerSetList = [];
  var setList = prefs.getStringList('playerSetList');
  if (setList != null) {
    setList.forEach((String playerSetJson) {
      Map playerSet = json.decode(playerSetJson);
      var setName = playerSet['name'];
      List playerList = playerSet['playerList'];
      List<Player> decodedPlayerList = [];

      playerList.forEach((player) {
        decodedPlayerList.add(fromJson(jsonDecode(player)));
      });
      playerSetList
          .add(PlayerSet(setName: setName, playerList: decodedPlayerList));
    });
  } else {
    return null;
  }
  return playerSetList;
}
//List of list of rules?
// List<List<Rule>> getStoredRulesList() {

// }

void persistPlayerSet(List<PlayerSet> playerSets, SharedPreferences prefs) {
  List<String> jsonList = [];
  playerSets.forEach((playerSet) {
    var playerJsonList = [];
    playerSet.playerList.forEach((player) {
      playerJsonList.add(player.toJson());
    });
    jsonList.add(
        json.encode({'name': playerSet.setName, 'playerList': playerJsonList}));
  });
  prefs.setStringList('playerSetList', jsonList);
}

void persistRulesList(List<Rule> ruleList, SharedPreferences prefs, int index) {
  List<String> jsonList = [];
  ruleList.forEach((rule) {
    jsonList.add(rule.toJson());
  });
  prefs.setStringList('rulelist $index', jsonList);
}
int getColorHexFromStr(String colorStr)
{
  colorStr = "FF" + colorStr;
  colorStr = colorStr.replaceAll("#", "");
  int val = 0;
  int len = colorStr.length;
  for (int i = 0; i < len; i++) {
    int hexDigit = colorStr.codeUnitAt(i);
    if (hexDigit >= 48 && hexDigit <= 57) {
      val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
    } else if (hexDigit >= 65 && hexDigit <= 70) {
      // A..F
      val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
    } else if (hexDigit >= 97 && hexDigit <= 102) {
      // a..f
      val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
    } else {
      throw new FormatException("An error occurred when converting a color");
    }
  }
  return val;
}