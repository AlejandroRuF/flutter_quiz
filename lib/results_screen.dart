import 'package:advanced_basics/data/questions.dart';
import 'package:advanced_basics/question_summary.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chosenAnswers, required this.restartQuiz});
  final List<String> chosenAnswers;
  final VoidCallback restartQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }

    return summary;
  }

  int correctAnswers() {
    List<Map<String, Object>> getSummary = getSummaryData();
    int numCorrect =
        getSummary
            .where(
              (element) => element['user_answer'] == element['correct_answer'],
            )
            .length;

    return numCorrect;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered ${correctAnswers()} out of ${chosenAnswers.length} questions correctly!',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            QuestionSummary(summaryData: getSummaryData()),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {restartQuiz();},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(Icons.arrow_back), Text('Restart Quiz')],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
