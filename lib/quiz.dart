import 'package:flutter/material.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final Function next_question;
  final int question_no;
  final List<Map<String, Object>> quiz;


  Quiz({required this.question_no, required this.quiz, required this.next_question});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30.0),
      width: double.infinity,
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          Text(
            quiz[question_no]['question'] as String,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20.0,
          ),
          ...(quiz[question_no]['answers'] as List<Map<String, Object>>)
              .map((answer) => Answer(
                  () => next_question(answer['score'] as int),
                  answer['answer'] as String))
              .toList()
        ],
      ),
    );
  }
}
