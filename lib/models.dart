
import 'dart:convert';

//MARK: CARDS
enum CardSuit {
  spades,
  hearts,
  diamonds,
  clubs,
}

enum CardType {
  ace,
  two,
  three,
  four,
  five,
  six,
  seven,
  eight,
  nine,
  ten,
  jack,
  queen,
  king
}

enum CardColor {
  red,
  black,
}

class PlayingCard {
  CardSuit cardSuit;
  CardType cardType;
  bool faceUp;
  bool opened;

  PlayingCard({
    this.cardSuit,
    this.cardType,
  });

  CardColor get cardColor {
    if (cardSuit == CardSuit.hearts || cardSuit == CardSuit.diamonds) {
      return CardColor.red;
    } else {
      return CardColor.black;
    }
  }
}


//MARK: PLAYERS
class Player {
  String name;
  //For now, system emojis
  String emoji;
  List<Rule> rulesApplied = [];
  Player({this.name, this.emoji});

  String toJson() {
    Map json = {'name': this.name, 'emoji': this.emoji};
    return jsonEncode(json);
  }
}

Player fromJson(json) {
  return Player(name: json['name'], emoji: json['emoji']);
}

class PlayerSet {
  String setName;
  List<Player> playerList;

  PlayerSet({this.setName, this.playerList});
}

//MARK: RULES
class Rule {
  final String ruleTitle;
  final String ruleText;
  bool persists = false;
  String emoji;
  Player assignedPlayer; //if persists
  CardType assignedCard;
  Rule(
      {this.ruleTitle,
      this.ruleText,
      this.persists,
      this.emoji,
      this.assignedCard});

  String toJson() {
    Map json = {
      'title': this.ruleTitle,
      'text': this.ruleText,
      'emoji': this.emoji,
      'persists': this.persists ?? false,
    };
    return jsonEncode(json);
  }

  Rule fromJson(json) {
    var ruleDict = jsonDecode(json);
    return Rule(
        ruleTitle: ruleDict['title'],
        ruleText: ruleDict['text'],
        emoji: ruleDict['emoji'],
        persists: ruleDict['persists']);
  }
}

class RuleSet {
  String title;
  String description;
  String imageUrl;
  List<Rule> ruleList;
  RuleSet({this.title, this.description, this.ruleList});
}

//MARK: STRINGS
const numbers = [
  "0",
  "1",
  "two",
  "three",
  "four",
  "five",
  "six",
  "seven",
  "eight",
  "nine",
  "ten"
];
const others = {"ace": "A", "jack": "J", "queen": "Q", "king": "K"};

final recommendedKeywords = [
  "party",
  "drink",
  "beer",
  "fun",
  "happy",
  "laugh",
  "laughing",
  "bear",
  "panda",
  "horse",
  "dog",
  "dead",
  "old"
];
final listOfNames = [
  "Tipsy Tommy",
  "Chandler the Lesser",
  "Party Marge",
  "El Barto",
  "Funky Tobias",
  "The Final Pam",
  "Ilana Wexler",
  "Heisenberg",
  "Aunt Trixie",
  "Old Joe",
  "Slimey Pete",
  "Boozey Betty",
  "Chadley",
  "Big Momma",
  "Mother of Pearl",
  "Mr Grundle",
//
  "G. Money",
  "Mama Kayler",
  "Actually Sarah",
  "KB Woolsworth",
  "Darn Yeller",
  "Laid-back Leo",
  "Pistol Pete",
  "Big Business Boy",
//
  "Box Madrid",
  "Fob Gunnar",
  "Big Daddy Don",
  "Hongle",
  "Mom Jeans",
  "Beyonce, but hotter",
  "Unopinionated Dairy Motel",
  "Rad Sad Dad",
  "Download Diamonds on Steam",
];
