import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  final VoidCallback onStart;

  const WelcomeScreen({required this.onStart, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/w7-s2/quiz-logo.png',
            width: 300,
          ),
          const SizedBox(height: 10),
          const Text(
            "Welcome to Quiz",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton.icon(
            onPressed: onStart,
            icon: const Icon(Icons.arrow_forward),
            label: const Text("Start Quiz"),
          ),
        ],
      ),
    );
  }
}
