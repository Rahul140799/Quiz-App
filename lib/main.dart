import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/quiz.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': " Where did Sachin score his 200 ?",
      'answerText': [
        {'text': 'Gwalior', 'score': 1},
        {'text': 'Indore', 'score': 0},
        {'text': 'Ranchi', 'score': 0},
        {'text': 'Kolkata', 'score': 0},
        {'text': 'None of the above', 'score': 0},
      ],
    },
    {
      'questionText': " When was overarm bowling accepted as legal ?",
      'answerText': [
        {'text': '1869', 'score': 0},
        {'text': '1864', 'score': 1},
        {'text': '1872', 'score': 0},
        {'text': '1889', 'score': 0},
        {'text': 'None of the above', 'score': 0},
      ],
    },
    {
      'questionText': " Which national team is nicknamed 'The Springboks' ?",
      'answerText': [
        {'text': 'England', 'score': 0},
        {'text': 'Ireland', 'score': 0},
        {'text': 'South Africa', 'score': 1},
        {'text': 'Netherlands', 'score': 0},
        {'text': 'None of the above', 'score': 0},
      ],
    },
    {
      'questionText':
          " Who is the only batsman to have hit a century in each innings of a Test thrice ? ",
      'answerText': [
        {'text': 'Lala Amarnath', 'score': 0},
        {'text': 'Sunil Gavaskar', 'score': 1},
        {'text': 'Sachin Tendulkar', 'score': 0},
        {'text': 'Virat Kohli', 'score': 0},
        {'text': 'None of the above', 'score': 0},
      ],
    },
    {
      'questionText': " Who won the first World Cup, 1975 ?",
      'answerText': [
        {'text': 'West Indies', 'score': 1},
        {'text': 'India', 'score': 0},
        {'text': 'England', 'score': 0},
        {'text': 'Australia', 'score': 0},
        {'text': 'None of the above', 'score': 0},
      ],
    },
  ];

  var _nextQuestion = 0;
  var _totalScore = 0;   
  
  void _resetQuiz() {
    setState(() {
        _nextQuestion = 0;
        _totalScore = 0;   
    });
  }

  void _answerQuestion(int score) {

    _totalScore += score;

    setState(() {
      _nextQuestion = _nextQuestion + 1;
    });
    print(_nextQuestion);

    if (_nextQuestion < _questions.length) {
      var remaining = _questions.length - _nextQuestion;
      print("$remaining questions left");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: _nextQuestion < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _nextQuestion,
                questions: _questions,
            )
            : Result(
              resultScore: _totalScore,
              resetQuiz: _resetQuiz,
            ),
      ),
    );
  }
}
