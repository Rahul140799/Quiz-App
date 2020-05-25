import 'package:flutter/material.dart';

import './question.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _nextQuestion = 0;

  void _answerQuestion() {
    setState(() {
      _nextQuestion = _nextQuestion + 1;
    });
    print(_nextQuestion);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      "What's your favorite color?",
      "What's your favorite animal?",
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: Column(children: [
          Question(
            questions[_nextQuestion]
          ),
          RaisedButton(
            child: Text("Answer 1"),
            onPressed: _answerQuestion,
          ),
          RaisedButton(
            child: Text("Answer 2"),
            onPressed: () => print("Answer 2 Chosen"),
          ),
          RaisedButton(
            child: Text("Answer 3"),
            onPressed: () {
              print("Answer 3 Chosen");
            },
          ),
        ]),
      ),
    );
  }
}
