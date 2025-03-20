import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final Function quizAnswer;
  final String answerText;

  const AnswerButton({super.key, required this.quizAnswer, required this.answerText});

  @override
  Widget build(Object context) {
    return ElevatedButton(
      onPressed: () => quizAnswer(),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple,
        fixedSize: Size(300, 30),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      
      child: Text(answerText, style: TextStyle(color: Colors.white)),
    );
  }
}
