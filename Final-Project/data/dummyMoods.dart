import 'package:test_flutter/Final-Project/models/mood_activety.dart';
import 'package:test_flutter/Final-Project/models/mood_category.dart';

final dummyMoods = [
   Moods(
      id: '1',
      title: 'Work Stress',
      note: 'Overwhelmed with work deadlines.',
      category: MoodCategory.stress,
      date: DateTime.now()),
   Moods(
      id: '2',
      title: 'Rainy Day',
      note: 'Feeling a bit down due to the rainy weather.',
      category: MoodCategory.sad,
      date: DateTime.now().subtract(const Duration(days:1)),),
   Moods(
      id: '3',
      title: 'Family Time',
      note: 'Had a great time with family over the weekend.',
      category: MoodCategory.happy,
      date: DateTime.now().subtract(const Duration(days:2)),),
];
