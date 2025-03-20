import 'package:advanced_basics/answer_button.dart';
import 'package:advanced_basics/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key, required this.onSelectedAnswer});

  final void Function(String answer) onSelectedAnswer;

  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  String answerResult = '';
  IconData answerIcon = Icons.wrong_location;
  bool answered = false;
  Color iconColor = Colors.red;

  int currentQuestionIndex = 0;

  void quizAnswer(String selectedAnswer) {
    widget.onSelectedAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (answered)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(answerIcon, color: iconColor, size: 40),
                Text(
                  answerResult,
                  style: GoogleFonts.monofett(
                    fontSize: 28,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          SizedBox(height: 20),
          Center(
            child: Text(
              currentQuestion.text,
              style: GoogleFonts.monomaniacOne(
                fontSize: 28,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20),
          ...currentQuestion.answersShuffled.map((item) {
            return AnswerButton(
              quizAnswer: () {
                quizAnswer(item);
              },
              answerText: item,
            );
          }),
        ],
      ),
    );
  }
}
