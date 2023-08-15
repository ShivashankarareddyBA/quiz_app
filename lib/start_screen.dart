import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Opacity(
            opacity: 0.9,
            child: Image.asset(
              'assets/logo.png',
              width: 300,
            ),
          ),
          // for image transforency we can use with on top by
          //setting image color it is more power full than opacity
          const SizedBox(height: 20),
          Text(
            'Learn Flutter Fun Way!',
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 199, 224, 241),
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 179, 238, 177),
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: Text(
              'Start Quiz',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 203, 221, 248),
                fontSize: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
