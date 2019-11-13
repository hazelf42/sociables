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

//0 and 1 left in for indexing brevity (no i-2)
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

class Player {
  final String name;
  //For now, system emojis
  final String emoji;
  Player({this.name, this.emoji});
}

class Rule {
  final String ruleTitle;
  final String ruleText;
  final bool persists;
  String emoji;
  Player assignedPlayer; //if persists
  CardType assignedCard;
  Rule({this.ruleTitle, this.ruleText, this.emoji, this.persists, this.assignedCard});

  void assignPlayer(Player player) {
    this.assignedPlayer = player;
  }

  void assignCard(CardType cardType) {
    this.assignedCard = cardType;
  }
}

//Dummy data
List<Rule> ruleList = [
  Rule(assignedCard: CardType.king, ruleTitle: "Kings Cup", ruleText: ".."),
  Rule(
      assignedCard: CardType.queen,
      ruleTitle: "Question Master",
      ruleText: ".."),
  Rule(assignedCard: CardType.jack, ruleTitle: "Beer bitch", ruleText: ".."),
  Rule(assignedCard: CardType.ten, ruleTitle: "Thumb master", ruleText: ".."),
  Rule(assignedCard: CardType.nine, ruleTitle: "Rhyme Time", ruleText: ".."),
  Rule(assignedCard: CardType.eight, ruleTitle: "Buddy", ruleText: ".."),
  Rule(assignedCard: CardType.seven, ruleTitle: "Sevens", ruleText: ".."),
  Rule(assignedCard: CardType.six, ruleTitle: "Chicks", ruleText: ".."),
  Rule(assignedCard: CardType.five, ruleTitle: "Dicks", ruleText: ".."),
  Rule(assignedCard: CardType.four, ruleTitle: "Troll", ruleText: ".."),
  Rule(assignedCard: CardType.three, ruleTitle: "LGM", ruleText: "..", emoji: "👽"),
  Rule(assignedCard: CardType.two, ruleTitle: "Give 2", ruleText: ".."),
  Rule(assignedCard: CardType.ace, ruleTitle: "sociables", ruleText: "..")
];
Rule getRule(CardType card, List<Rule> ruleList) {
  Rule aRule;
  ruleList.forEach((rule) {
    if (rule.assignedCard == card) {
      aRule = rule;
    }
  });
  return aRule;
} 