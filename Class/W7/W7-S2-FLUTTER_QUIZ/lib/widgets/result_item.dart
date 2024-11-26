import 'package:flutter/material.dart';
import 'package:test_flutter/W7-S2-FLUTTER_QUIZ/lib/model/quiz.dart';
import 'package:test_flutter/W7-S2-FLUTTER_QUIZ/lib/widgets/question_identifier.dart';

class ResultItem extends StatelessWidget {
  final int questionNumber;
  final Question question;
  final String userAnswer;
  final String correctAnswer;

  const ResultItem({super.key, 
    required this.questionNumber,
    required this.question,
    required this.userAnswer,
    required this.correctAnswer,
  });

  @override
  Widget build(BuildContext context) {
    bool isCorrect = userAnswer == correctAnswer;

    return Padding(
      padding: const EdgeInsets.only(left: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              QuestionIdentifier(questionNumber: questionNumber, isCorrect: isCorrect),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  question.title,
                  style: const TextStyle(fontSize: 15.0, color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          for (var answer in question.possibleAnswers)
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Text(
                    answer,
                    style: TextStyle(
                      color: userAnswer == answer
                          ? (answer == correctAnswer ? Colors.green : Colors.red)
                          : Colors.white,
                    ),
                  ),
                ),
                if (answer == correctAnswer)
                  const Padding(
                  padding:  EdgeInsets.only(left: 10.0),
                  child:Icon(Icons.check, color: Color.fromARGB(255, 22, 22, 22), size: 16.0), 
                  ),
              ],
            ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
