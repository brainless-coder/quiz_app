import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userInput) {
    bool correctAnswer = quizBrain.getQuestionAnswer();

    setState(() {
      if (correctAnswer == userInput) {
        scoreKeeper.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        scoreKeeper.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }

      quizBrain.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: FlatButton(
              color: Colors.green,
              textColor: Colors.white,
              child: Text(
                'True',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                // The user picked true.
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: FlatButton(
              color: Colors.red,
              textColor: Colors.white,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                // The user picked false.
                checkAnswer(false);
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
