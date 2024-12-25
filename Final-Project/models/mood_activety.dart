import 'mood_category.dart';

class Moods {
  final String id;
  final String title;
  final String note;
  final MoodCategory category;
  final DateTime date;  // added 'final' keyword for consistency

  Moods({
    required this.id,
    required this.title,
    required this.note,
    required this.category,
    required this.date,  // corrected the initialization
  });

  @override
  String toString() {
    return "Title: $title, Note: $note";
  }
}
