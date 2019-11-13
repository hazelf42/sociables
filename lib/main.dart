import 'package:flutter/material.dart';
import 'package:sociables/playerlist.dart';

import 'businesslogicbaby.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
              display1: TextStyle(fontSize: 28, color: Colors.white),
              display2: TextStyle(fontSize: 21, color: Colors.white))),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  final cards = shuffle();
  @override
  _MyHomePageState createState() => _MyHomePageState(cards);
}

class _MyHomePageState extends State<MyHomePage> {
  final cards;
  _MyHomePageState(this.cards);
  var index = 0;
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Sociables")),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("lib/assets/felt background.jpg"),
                    fit: BoxFit.cover)),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                      child: Text("Edit players"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PlayersList()),
                        );
                      }),
                  Center(
                    child: FlatButton(
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                "🐻 \n Player 1",
                                style: Theme.of(context).textTheme.display2,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            _suitToImage(cards[index]),
                            Text(
                              getRule(cards[index].cardType, ruleList)
                                      .ruleTitle ??
                                  "Rule not found",
                              style: Theme.of(context).textTheme.display1,
                            )
                          ],
                        ),
                        onPressed: () {
                          setState(() {
                            index = index + 1;
                          });
                        }),
                  ),
                ])));
  }

  Widget _suitToImage(PlayingCard card) {
    var suitInitial = card.cardSuit.toString().substring(9)[0].toUpperCase();
    var cardTypeSubstring = card.cardType.toString().substring(9);
    var cardType;
    if (numbers.contains(cardTypeSubstring)) {
      cardType = numbers.indexOf(cardTypeSubstring);
    } else {
      cardType = others[cardTypeSubstring];
    }
    return Container(
        height: MediaQuery.of(context).size.height - 200,
        padding: EdgeInsets.all(5),
        child: Image.asset("lib/assets/$cardType$suitInitial.png",
            fit: BoxFit.contain));
  }
}
