import 'package:advanced_basics/content_main.dart';
import 'package:advanced_basics/data/questions.dart';
import 'package:advanced_basics/quiz.dart';
import 'package:advanced_basics/results_screen.dart';
import 'package:flutter/material.dart';

Alignment begin = Alignment.topLeft;
Alignment end = Alignment.bottomRight;

class QuizScreen extends StatefulWidget {
  final List<Color> colors;

  // Constructor para recibir los colores
  const QuizScreen({
    super.key,
    this.colors = const [
      Color.fromARGB(255, 198, 151, 229),
      Color.fromARGB(255, 89, 23, 134),
    ],
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<String> selectedAnswers = [];
  late Widget activeScreen;
  

  @override
  void initState() {
    super.initState();
    activeScreen = ContentMain(switchScreen: switchScreen);
    selectedAnswers.clear();
  }

  void switchScreen() {
    setState(() {
      activeScreen = Quiz(onSelectedAnswer: chooseAnswer);
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length >= questions.length) {

      setState(() {
        activeScreen = ResultScreen(chosenAnswers: selectedAnswers, restartQuiz: restartQuiz );
      });

    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers.clear();
      activeScreen = Quiz(onSelectedAnswer: chooseAnswer);
    });
  }

  @override
  Widget build(BuildContext context) {
    selectedAnswers = []; 
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors:
                  widget
                      .colors,
              begin: begin,
              end: end,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
