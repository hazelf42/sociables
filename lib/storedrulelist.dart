import 'businesslogicbaby.dart';

List<Rule> classicRuleList = [
  Rule(assignedCard: CardType.king, ruleTitle: "Kings Cup", ruleText: "Get a big cup. Everyone puts a little of their drink in the cup. Whoever draws the final card must drink it!"),
  Rule(
      assignedCard: CardType.queen,
      ruleTitle: "Question Master",
      ruleText:
          "The player becomes your Question Master. If they ask you a question and you answer it, you must drink. If you begin your answer with 'Fuck You Questionmaster,' the Question Master must drink.",
      emoji: "❓",
      persists: true),
  Rule(
      assignedCard: CardType.jack,
      ruleTitle: "Beer bitch",
      ruleText:
          "The player is now the Beer Bitch, and fetch the rest of the party their drinks.",
      emoji: "🍺",
      persists: true),
  Rule(assignedCard: CardType.ten, ruleTitle: "Thumb master", ruleText: ".."),
  Rule(
    assignedCard: CardType.nine,
    ruleTitle: "Rhyme Time",
    ruleText:
        "Choose a word. Starting to the left, all players go around the circle saying words that rhyme with the original. No word can be said twice. The first player to fail to say a word or who says a word that doesn’t rhyme must take a drink.",
  ),
  Rule(
      assignedCard: CardType.eight,
      ruleTitle: "Buddy System",
      ruleText:
          "The player picks their best friend (or worst enemy) to be their drinking buddy. When they drink, so does their buddy, until the next time this card is drawn."),
  Rule(
      assignedCard: CardType.seven,
      ruleTitle: "Sevens",
      ruleText:
          "Hope you didn't skip math class. Go around the circle counting upwards. Any time you reach a multiple of 7 or a number with 7 in it, say “Fuck you” and change directions. The first player to mess up takes a drink and the round ends."),
  Rule(
      assignedCard: CardType.six,
      ruleTitle: "Chicks drink",
      ruleText: "Women drink!"),
  Rule(assignedCard: CardType.five, ruleTitle: "Dicks", ruleText: "Men drink!"),
  Rule(
      assignedCard: CardType.four,
      ruleTitle: "Troll",
      ruleText:
          "This player is now the troll under the bridge. They must sit under the table (or on the floor) til this card is drawn again.",
      emoji: "👺",
      persists: true),
  Rule(
      assignedCard: CardType.three,
      ruleTitle: "LGM",
      ruleText:
          "This player has a little green man living on their drink. Every time they drink, they must lovingly remove him, drink, then carefully place him back on their drink. If you catch them sipping without moving the man, they drink!",
      emoji: "👽",
      persists: true),
  Rule(
      assignedCard: CardType.two,
      ruleTitle: "Give 2",
      ruleText: "Give two drinks to another player."),
  Rule(
      assignedCard: CardType.ace,
      ruleTitle: "Sociables",
      ruleText: "Sociables! Everyone drinks.")
];

List<Rule> noGenderClassic = [
  Rule(assignedCard: CardType.king, ruleTitle: "Kings Cup", ruleText: "Get a big cup. Everyone puts a little of their drink in the cup. Whoever draws the final card must drink it!"),
  Rule(
      assignedCard: CardType.queen,
      ruleTitle: "Question Master",
      ruleText:
          "The player becomes your Question Master. If they ask you a question and you answer it, you must drink. If you begin your answer with 'Fuck You Questionmaster,' the Question Master must drink.",
      emoji: "❓",
      persists: true),
  Rule(
      assignedCard: CardType.jack,
      ruleTitle: "Beer bitch",
      ruleText:
          "The player is now the Beer Bitch, and fetch the rest of the party their drinks.",
      emoji: "🍺",
      persists: true),

  Rule(assignedCard: CardType.ten, 
  emoji: "👍",
  persists: true,
  ruleTitle: "Thumb master", ruleText: "This player is now Thumb Master. If they put their thumb on the table, everyone must follow. Last to put their thumb on the table drinks."),
  Rule(
    assignedCard: CardType.nine,
    ruleTitle: "Rhyme Time",
    ruleText:
        "Choose a word. Starting to the left, all players go around the circle saying words that rhyme with the original. No word can be said twice. The first player to fail to say a word or who says a word that doesn’t rhyme must take a drink.",
  ),
  Rule(
      assignedCard: CardType.eight,
      ruleTitle: "Buddy System",
      ruleText:
          "The player picks their best friend (or worst enemy) to be their drinking buddy. When they drink, so does their buddy, until the next time this card is drawn."),
  Rule(
      assignedCard: CardType.seven,
      ruleTitle: "Sevens",
      ruleText:
          "Hope you didn't skip math class. Go around the circle counting upwards. Any time you reach a multiple of 7 or a number with 7 in it, say “Fuck you” and change directions. The first player to mess up takes a drink and the round ends."),
  Rule(
      assignedCard: CardType.six,
      ruleTitle: "I drink",
      ruleText: "Player drinks."),
  Rule(assignedCard: CardType.five, ruleTitle: "You drink", ruleText: "Give a drink."),
  Rule(
      assignedCard: CardType.four,
      ruleTitle: "Troll",
      ruleText:
          "This player is now the troll under the bridge. They must sit under the table (or on the floor) til this card is drawn again.",
      emoji: "👺",
      persists: true),
  Rule(
      assignedCard: CardType.three,
      ruleTitle: "LGM",
      ruleText:
          "This player has a little green man living on their drink. Every time they drink, they must lovingly remove him, drink, then carefully place him back on their drink. If you catch them sipping without moving the man, they drink!",
      emoji: "👽",
      persists: true),
  Rule(
      assignedCard: CardType.two,
      ruleTitle: "Give 2",
      ruleText: "Give two drinks to another player."),
  Rule(
      assignedCard: CardType.ace,
      ruleTitle: "Sociables",
      ruleText: "Sociables! Everyone drinks.")
];

List<Rule> drinkingGamesOnly = [
  Rule(assignedCard: CardType.jack, ruleTitle: "Community Cup", ruleText: "(King's cup, but King was taken) "),
  Rule(assignedCard: CardType.queen, ruleTitle: "Never have I Ever"),
  Rule(assignedCard: CardType.three, ruleTitle: "Suck n Blow", ruleText: ".."),
  Rule(assignedCard: CardType.ten, ruleTitle: "Story Time", ruleText: ".."),
  Rule(
    assignedCard: CardType.nine,
    ruleTitle: "Rhyme Time",
    ruleText: "..",
  ),
  Rule(assignedCard: CardType.eight, ruleTitle: "Waterfall", ruleText: ".."),
  Rule(assignedCard: CardType.seven, ruleTitle: "Fuzzy Duck", ruleText: ".."),
  Rule(assignedCard: CardType.six, ruleTitle: "Flip Cup", ruleText: ".."),
  Rule(assignedCard: CardType.five, ruleTitle: "Scattegories", ruleText: ".."),
  Rule(assignedCard: CardType.four, ruleTitle: "Moose", ruleText: ".."),
  Rule(
      assignedCard: CardType.king,
      ruleTitle: "King Shit",
      ruleText: "Alt. Title: Asshole God",
      emoji: "King emoji",
      persists: true),
  Rule(assignedCard: CardType.two, ruleTitle: "Hot Seat", ruleText: ".."),
  Rule(assignedCard: CardType.ace, ruleTitle: "Sociables", ruleText: "..")
];


List<Rule> tameRuleList = [
  Rule(assignedCard: CardType.king, )
  ,
   Rule(
      assignedCard: CardType.queen,
      ruleTitle: "Question Master",
      ruleText:
          "The player becomes your Question Master. If they ask you a question and you answer it, you must drink. If you begin your answer with 'Fuck You Questionmaster,' the Question Master must drink.",
      emoji: "❓",
      persists: true),
  Rule(
      assignedCard: CardType.jack,
      ruleTitle: "Beer bitch",
      ruleText:
          "The player is now the Beer Bitch, and fetch the rest of the party their drinks.",
      emoji: "🍺",
      persists: true),
  Rule(assignedCard: CardType.ten, ruleTitle: "Thumb master", ruleText: ".."),
  Rule(
    assignedCard: CardType.nine,
    ruleTitle: "Rhyme Time",
    ruleText:
        "Choose a word. Starting to the left, all players go around the circle saying words that rhyme with the original. No word can be said twice. The first player to fail to say a word or who says a word that doesn’t rhyme must take a drink.",
  ),
  Rule(
      assignedCard: CardType.eight,
      ruleTitle: "Buddy System",
      ruleText:
          "The player picks their best friend (or worst enemy) to be their drinking buddy. When they drink, so does their buddy, until the next time this card is drawn."),
  Rule(
      assignedCard: CardType.seven,
      ruleTitle: "Sevens",
      ruleText:
          "Hope you didn't skip math class. Go around the circle counting upwards. Any time you reach a multiple of 7 or a number with 7 in it, say “Fuck you” and change directions. The first player to mess up takes a drink and the round ends."),
  Rule(
      assignedCard: CardType.six,
      ruleTitle: "Chicks drink",
      ruleText: "Women drink!"),
  Rule(assignedCard: CardType.five, ruleTitle: "Dicks", ruleText: "Men drink!"),
  Rule(
      assignedCard: CardType.four,
      ruleTitle: "Troll",
      ruleText:
          "This player is now the troll under the bridge. They must sit under the table (or on the floor) til this card is drawn again.",
      emoji: "👺",
      persists: true),
  Rule(
      assignedCard: CardType.three,
      ruleTitle: "LGM",
      ruleText:
          "This player has a little green man living on their drink. Every time they drink, they must lovingly remove him, drink, then carefully place him back on their drink. If you catch them sipping without moving the man, they drink!",
      emoji: "👽",
      persists: true),
  Rule(
      assignedCard: CardType.two,
      ruleTitle: "Give 2",
      ruleText: "Give two drinks to another player."),
  Rule(
      assignedCard: CardType.ace,
      ruleTitle: "Sociables",
      ruleText: "Sociables! Everyone drinks.")
];

RuleSet classicRuleSet = RuleSet(
    ruleList: classicRuleList,
    title: "Classic",
    description: "Why overcomplicate drinking?");

RuleSet noGenderRuleSet = RuleSet(
  ruleList: noGenderClassic,
  title: "Gender Is A Social Construct",
  description: "The classic, but with no chicks/dicks drink rules, because it's 2019, people."
);

RuleSet drinkingGamesOnlySet = RuleSet(
  ruleList: drinkingGamesOnly,
  title: "Drinking Games Only",
  description: "Because you did(n't) come here to play."
);

RuleSet tameGamesSet = RuleSet(
  ruleList: tameRuleList,
  title: "Tame Games",
  description: "Your boss is here, your grandma is here, we get it. Here's a safe for work/family/acquaintances you don't wanna embarrass yourself in front of game."
);

List<RuleSet> listOfRuleSets = [classicRuleSet, noGenderRuleSet, drinkingGamesOnlySet, tameGamesSet ];
