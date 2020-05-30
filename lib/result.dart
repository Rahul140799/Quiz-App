import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetQuiz;

  Result({
    @required this.resultScore,
    @required this.resetQuiz,
  });

  String get resultPhrase {
    String resultText;
    if (resultScore <= 1) {
      resultText = "You scored $resultScore \n You are useless";
    } else if (resultScore > 1 && resultScore <= 3) {
      resultText = "You scored $resultScore \n You need to watch more games";
    } else {
      resultText =
          "You scored $resultScore \n AHHH! Finally, a worthy opponent!";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text(
              'Restart Quiz'
            ),
            textColor: Colors.blue,
            onPressed: resetQuiz,
          ),
        ],
      ),
    );
  }
}
