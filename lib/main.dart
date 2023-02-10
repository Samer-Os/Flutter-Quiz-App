import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var quiz = [
    {
      'question': 'what is the second name of messi ?',
      'answers': [
        {'answer': 'cristiano', 'score': 0},
        {'answer': 'leo', 'score': 25},
        {'answer': 'neymar', 'score': 0},
        {'answer': 'haland', 'score': 0}
      ]
    },
    {
      'question': 'what is the capital of spain ?',
      'answers': [
        {'answer': 'barcelona', 'score': 0},
        {'answer': 'berlin', 'score': 0},
        {'answer': 'madrid', 'score': 25},
        {'answer': 'london', 'score': 0}
      ]
    },
    {
      'question': 'messi\'s current team is....',
      'answers': [
        {'answer': 'fc barcelona', 'score': 0},
        {'answer': 'psg', 'score': 25},
        {'answer': 'man city', 'score': 0},
        {'answer': 'chelsea', 'score': 0}
      ]
    },
    {
      'question': 'the capital of germany is.... ?',
      'answers': [
        {'answer': 'ankara', 'score': 0},
        {'answer': 'berlin', 'score': 25},
        {'answer': 'liverpool', 'score': 0},
        {'answer': 'paris', 'score': 0}
      ]
    },
  ];

  var question_no = 0;
  var totalScore = 0;

  void resetQuiz() {
    setState(() {
      question_no = 0;
      totalScore = 0;
    });
  }

  void next_question(int score) {
    setState(() {
      question_no = question_no + 1;
      totalScore = totalScore + score;
      if (question_no < 4) {
        (quiz[question_no]['answers'] as List).shuffle();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('my quiz app'),
          backgroundColor: Colors.lime,
          centerTitle: true,
        ),
        body: question_no < quiz.length
            ? Quiz(
                question_no: question_no,
                quiz: quiz,
                next_question: next_question,
              )
            : Result(
                totalScore: totalScore,
                resetQuiz: resetQuiz,
              ),
      ),
    );
  }
}
