import 'package:flutter/material.dart';
import 'package:flutter_quiz/data/questions.dart';
import 'package:flutter_quiz/questions_screen.dart';
import 'package:flutter_quiz/start_screen.dart';
import 'package:flutter_quiz/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  final List<String> _selectedAnswers = []; // storing selected ans

  var activeScreen = 'start-Screen'; // it could even be a number rfer to screen

  // Widget? activeScreen; istead of storing active
  //screen we could also store from identifier for a screen here.

  //@override
  //void initState() {
  //  activeScreen = StartScreen(switchScreen);
  // super.initState();
  // }  this work we can use but we need use init state to switch screen

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  //storing selected ans---method
  void chooseAnswer(String answer) {
    _selectedAnswers.add(answer);
    if (_selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(context) {
    // will use if condition
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionScreen(
        onSelectAnswer: chooseAnswer,
      );
    }
    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: _selectedAnswers,
      );
    }

    // here still we using ternary operation
    //final screenWidget = activeScreen == 'start-screen'
    //    ? StartScreen(switchScreen)
    //    : const QuestionScreen();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 140, 169, 194),
                Color.fromARGB(255, 66, 87, 170),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
          //ternary experesion
          //child: activeScreen == 'start-screen'
          //    ? StartScreen(switchScreen)
          //    : const QuestionScreen(),
        ),
      ),
    );
  }
}
