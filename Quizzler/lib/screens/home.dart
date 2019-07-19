import 'package:flutter/material.dart';
import 'package:quizzler/model/question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  static const questions = [
    Question('The answer is true 1', true),
    Question('The answer is false 2', false),
    Question('The answer is true 3', true),
    Question('The answer is false 4', false),
  ];

  int currentQuestion = 0;
  List<bool> answers = [];

  List<Icon> _renderCorrectionsRow() {
    return answers
        .map((item) => Icon(
              item ? Icons.check : Icons.error,
              color: item ? Colors.green : Colors.red,
            ))
        .toList();
  }

  void _checkAnswer(bool answer) {
    Question current = questions[currentQuestion];
    bool isCorrent = answer == current.answer;
    setState(() {
      if (answers.length <= questions.length - 1) answers.add(isCorrent);
      if (currentQuestion < questions.length - 1) currentQuestion++;
    });
    if (answers.length == questions.length) _showReachedEndAlert();
  }

  void _startAgain() {
    setState(() {
      currentQuestion = 0;
      answers = [];
    });
  }

  void _showReachedEndAlert() {
    Alert(
        context: context,
        title: "Good Job",
        desc: "You answered all the questions. Would like to start again?",
        buttons: [
          DialogButton(
              child: Text('Yep'),
              color: Colors.green,
              onPressed: () {
                _startAgain();
                Navigator.pop(context);
              }),
          DialogButton(
              color: Colors.red,
              child: Text('Nop'),
              onPressed: () => Navigator.pop(context))
        ]).show();
  }

  Expanded _renderButton(String text, Color color, bool type) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: FlatButton(
          textColor: Colors.white,
          color: color,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
          onPressed: () => _checkAnswer(type),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questions[currentQuestion].text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        _renderButton('True', Colors.green, true),
        _renderButton('False', Colors.red, false),
        Row(children: _renderCorrectionsRow())
      ],
    );
  }
}
