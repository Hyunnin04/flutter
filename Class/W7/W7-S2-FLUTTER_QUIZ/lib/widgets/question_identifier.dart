import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {
  final int questionNumber;
  final bool isCorrect; 

  const QuestionIdentifier({super.key, 
    required this.questionNumber,
    required this.isCorrect, 
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: FractionalOffset.center, 
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: isCorrect ? Colors.green : Colors.red, 
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            '$questionNumber',
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold), 
          ),
        ),
      ),
    );
  }
}
