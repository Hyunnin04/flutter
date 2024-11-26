import 'package:flutter/material.dart';
import 'package:test_flutter/W7-S2-FLUTTER_QUIZ/lib/model/quiz.dart';
import 'package:test_flutter/W7-S2-FLUTTER_QUIZ/lib/model/submission.dart';
import 'package:test_flutter/W7-S2-FLUTTER_QUIZ/lib/widgets/result_item.dart';

class ResultScreen extends StatelessWidget {
  final Quiz quiz;
  final Submission submission;
  final VoidCallback onRestart;

  const ResultScreen({super.key, required this.quiz, required this.submission, required this.onRestart});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Quiz Completed!',
              style: TextStyle(fontSize: 24.0, color: Colors.white),
            ),
            const SizedBox(height: 20),
            Text(
              'You got ${submission.getScore()} out of ${quiz.questions.length} correct!',
              style: const TextStyle(fontSize: 20.0, color: Colors.white),
            ),
            const SizedBox(height: 20),
            for (var numberQuestion = 0; numberQuestion < quiz.questions.length; numberQuestion++)
              ResultItem(
                questionNumber: numberQuestion + 1,
                question: quiz.questions[numberQuestion],
                userAnswer: submission
                        .getAnswerFor(quiz.questions[numberQuestion]) ?.questionAnswer ?? '',
                correctAnswer: quiz.questions[numberQuestion].goodAnswer,
              ),
            ElevatedButton.icon(
              onPressed: onRestart,
              icon: const Icon(Icons.restart_alt),
              label: const Text("Restart Quiz"),
            ),
          ],
        ),
      ),
    );
  }
}
