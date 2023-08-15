import 'package:flutter/material.dart';
import 'package:flutter_quiz/answer_button.dart';
import 'package:flutter_quiz/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

// accesing elements and object propertie from the questions.dart file

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({
    super.key,
    required this.onSelectAnswer,
  });

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;
  answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer('');
    setState(() {
      currentQuestionIndex++;
    });

    //currentQuestionIndex = currentQuestionIndex +1;
    //currentQuestionIndex += 1;   for decrement also same we can use --
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(232, 205, 225, 241),
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.shuffledAnswers.map((answer) {
              return AnswerButton(
                answerText: answer,
                onTap: () {
                  answerQuestion(answer);
                },
              );
            })

            //code duplcation rather will use maping and using spread oprator
            //AnswerButton(answerText: currentQuestion.answers[0], onTap: () {}),
            //AnswerButton(answerText: currentQuestion.answers[1], onTap: () {}),
            //AnswerButton(answerText: currentQuestion.answers[2], onTap: () {}),
            //AnswerButton(answerText: currentQuestion.answers[3], onTap: () {})
          ],
        ),
      ),
    );
  }
}
