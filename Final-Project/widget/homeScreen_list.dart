import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_flutter/Final-Project/data/dummyMoods.dart';
import 'package:test_flutter/Final-Project/models/mood_activety.dart';
import 'package:test_flutter/Final-Project/widget/MoodAnalysisScreen.dart';
import 'package:test_flutter/Final-Project/widget/new_mood_list.dart';
import 'quote_screen.dart'; // Import the new screen

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Moods? recentlyDeletedMood;
  int? recentlyDeletedMoodIndex;

  // Function to add a new mood
  void _addMood() async {
    final newMood = await Navigator.of(context).push<Moods>(
      MaterialPageRoute(
        builder: (ctx) => const NewMood(mode: Mode.creating),
      ),
    );
    if (newMood != null) {
      setState(() {
        dummyMoods.add(newMood);
      });
    }
  }

  // Function to edit an existing mood
  void _editMood(Moods item) async {
    final editedItem = await Navigator.of(context).push<Moods>(
      MaterialPageRoute(
        builder: (ctx) => NewMood(mode: Mode.editing, editedMood: item),
      ),
    );
    if (editedItem != null) {
      setState(() {
        final index = dummyMoods.indexWhere((element) => element.id == item.id);
        if (index != -1) {
          dummyMoods[index] = editedItem;
        }
      });
    }
  }

  // Function to remove a mood
  void _removeMood(String id) {
    setState(() {
      final moodIndex = dummyMoods.indexWhere((mood) => mood.id == id);
      if (moodIndex != -1) {
        recentlyDeletedMood = dummyMoods[moodIndex];
        recentlyDeletedMoodIndex = moodIndex;
        dummyMoods.removeAt(moodIndex);
      }
    });
  }

  // Function to undo deletion
  void _undoDelete() {
    setState(() {
      if (recentlyDeletedMood != null && recentlyDeletedMoodIndex != null) {
        dummyMoods.insert(recentlyDeletedMoodIndex!, recentlyDeletedMood!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text(
        'No mood added yet.',
        style: TextStyle(color: Colors.white),
      ),
    );

    if (dummyMoods.isNotEmpty) {
      content = ListView.builder(
        itemCount: dummyMoods.length,
        itemBuilder: (context, index) {
          final mood = dummyMoods[index];
          return Dismissible(
            key: ValueKey(mood.id),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              _removeMood(mood.id);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${mood.title} has been deleted'),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: _undoDelete,
                  ),
                ),
              );
            },
            child: MoodTile(
              mood,
              onTap: _editMood,
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Mood Every Day',
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        backgroundColor: const Color.fromARGB(255, 172, 191, 207),
        actions: [
          IconButton(
            icon: const Icon(Icons.format_quote, color: Colors.white),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const QuoteScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.bar_chart, color: Colors.white),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const MoodAnalysisScreen()),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addMood,
        tooltip: 'Add New Mood',
        backgroundColor: const Color.fromARGB(255, 172, 191, 207),
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
      backgroundColor: const Color.fromARGB(255, 19, 50, 58),
      body: content,
    );
  }
}

class MoodTile extends StatefulWidget {
  const MoodTile(this.mood, {super.key, required this.onTap});

  final Moods mood;
  final Function(Moods) onTap;

  @override
  _MoodTileState createState() => _MoodTileState();
}

class _MoodTileState extends State<MoodTile> {
  bool isFavorite = false; // Local state for favorite status

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat.yMd().format(widget.mood.date);
    return Card(
      margin: const EdgeInsets.all(8.0),
      color: const Color.fromARGB(255, 207, 227, 245),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            // Favorite heart icon
            IconButton(
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
              icon: Icon(
                Icons.favorite,
                color: isFavorite
                    ? Colors.red
                    : Colors.blueGrey, // Change color based on state
              ),
            ),
            const SizedBox(width: 12),
            // Mood details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.mood.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(221, 46, 46, 46),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    widget.mood.note,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(137, 69, 63, 63),
                    ),
                  ),
                ],
              ),
            ),
            // Category icon and date
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(
                  widget.mood.category.icon,
                  color: widget.mood.category.color,
                  size: 35.0,
                ),
                const SizedBox(height: 8),
                Text(
                  formattedDate,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color.fromARGB(138, 54, 57, 65),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
