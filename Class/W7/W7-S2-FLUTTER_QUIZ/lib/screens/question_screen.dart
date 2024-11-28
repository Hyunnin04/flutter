import 'package:flutter/material.dart';
import 'package:test_flutter/W7-S2-FLUTTER_QUIZ/lib/model/quiz.dart';

class QuestionScreen extends StatelessWidget {
  final Quiz quiz;
  final void Function(String answer) onAnswer;
  final int currentQuestionIndex;

  const QuestionScreen({
    required this.quiz,
    required this.onAnswer,
    required this.currentQuestionIndex,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final currentQuestion = quiz.questions[currentQuestionIndex];

    return Container(
      color: Colors.blue,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              currentQuestion.title,
              style: const TextStyle(fontSize: 24.0, color: Colors.white)),
            const SizedBox(height: 20),
            for (var answer in currentQuestion.possibleAnswers)
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: SizedBox(
                  width: 250,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => onAnswer(answer), 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(104, 255, 253, 253),
                      shadowColor: Colors.transparent,
                    ),
                    child: Text(answer, style: const TextStyle(color: Colors.white)),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
