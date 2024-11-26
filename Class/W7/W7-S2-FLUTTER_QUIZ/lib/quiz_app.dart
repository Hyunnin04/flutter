import 'package:flutter/material.dart';
import 'package:test_flutter/W7-S2-FLUTTER_QUIZ/lib/model/submission.dart';
import 'package:test_flutter/W7-S2-FLUTTER_QUIZ/lib/screens/question_screen.dart';
import 'package:test_flutter/W7-S2-FLUTTER_QUIZ/lib/screens/result_screen.dart';
import 'package:test_flutter/W7-S2-FLUTTER_QUIZ/lib/screens/welcome_screen.dart';
import 'model/quiz.dart';

enum QuizState { not_started, started, finished }

Color appColor = Colors.blue[500] as Color;

class QuizApp extends StatefulWidget {
  const QuizApp(this.quiz, {super.key});

  final Quiz quiz;

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  // Track the current state of the quiz
  QuizState quizState = QuizState.not_started;
  int currentQuestionIndex = 0;
  final Submission submission = Submission();

  void switchScreen(QuizState state) {
    setState(() {
      if (state == QuizState.not_started) {
        currentQuestionIndex = 0;
        submission.removeAnswers(); 
      }
      quizState = state;
    });
  }

  void onAnswer(String answer) {
    final currentQuestion = widget.quiz.questions[currentQuestionIndex];
    submission.addAnswer(currentQuestion, answer);

    setState(() {
      if (currentQuestionIndex < widget.quiz.questions.length - 1) {
        currentQuestionIndex++;
      } else {
        switchScreen(QuizState.finished);
      }
    });
  }

  Widget getScreen() {
    switch (quizState) {
      case QuizState.not_started:
        return WelcomeScreen(
          onStart: () {
            setState(() {
              currentQuestionIndex = 0;
              submission.removeAnswers(); 
            });
            switchScreen(QuizState.started);
          },
        );
      case QuizState.started:
        return QuestionScreen(
          quiz: widget.quiz,
          onAnswer: (answer) => onAnswer(answer), 
          currentQuestionIndex: currentQuestionIndex,
        );
      case QuizState.finished:
        return ResultScreen(
          quiz: widget.quiz,
          submission: submission, 
          onRestart: () => switchScreen(QuizState.not_started),
        );
      default:
        return WelcomeScreen(
          onStart: () => switchScreen(QuizState.not_started),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: appColor,
        body: getScreen(),
      ),
    );
  }
}
