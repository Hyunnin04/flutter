import 'package:flutter/material.dart';

enum MoodCategory {
  happy('Happy', Icons.sentiment_satisfied, Colors.yellow),
  sad('Sad', Icons.sentiment_dissatisfied, Colors.blue),
  stress('Stress', Icons.sentiment_very_dissatisfied, Colors.red),
  other('Other', Icons.sentiment_neutral, Colors.grey);

  final String label;
  final IconData icon;
  final Color color;

  const MoodCategory(this.label, this.icon, this.color);
}
