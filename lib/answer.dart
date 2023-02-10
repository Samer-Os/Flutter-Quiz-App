import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback handleFunction;
  final String answerText;

  Answer(this.handleFunction, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: handleFunction,
        child: Text(
          answerText,
        ),
        style: ElevatedButton.styleFrom(
          fixedSize: Size( 200.0, 20.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
    );
  }
}
