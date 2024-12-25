import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_flutter/Final-Project/models/mood_activety.dart';
import 'package:test_flutter/Final-Project/models/mood_category.dart';
import 'package:uuid/uuid.dart';

enum Mode { editing, creating }

class NewMood extends StatefulWidget {
  const NewMood({
    super.key,
    required this.mode,
    this.editedMood,
  });

  final Moods? editedMood;
  final Mode mode;

  @override
  State<NewMood> createState() {
    return _NewMoodState();
  }
}

class _NewMoodState extends State<NewMood> {
  DateTime? _selectedDate;
  final _formKey = GlobalKey<FormState>();
  final _uuid = const Uuid();

  String _enteredTitle = '';
  String _enteredNote = '';
  MoodCategory? _defaultCategory = MoodCategory.happy;

  @override
  void initState() {
    super.initState();
    // Update values if in editing mode
    if (widget.mode == Mode.editing) {
      _enteredTitle = widget.editedMood!.title;
      _enteredNote = widget.editedMood!.note;
      _defaultCategory = widget.editedMood!.category;
      _selectedDate = widget.editedMood!.date;
    }
  }

  void _saveItem() {
    bool isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();

      final newItem = Moods(
        id: _uuid.v4(),
        note: _enteredNote,
        title: _enteredTitle,
        category: _defaultCategory!,
        date: _selectedDate ?? DateTime.now(),
      );

      Navigator.pop(context, newItem);
    }
  }

  void _resetForm() {
    _formKey.currentState!.reset();
    setState(() {
      _enteredTitle = '';
      _enteredNote = '';
      _defaultCategory = MoodCategory.happy;
      _selectedDate = null;
    });
  }

  String? validateTitle(String? value) {
    if (value == null ||
        value.isEmpty ||
        value.trim().length <= 1 ||
        value.trim().length > 5000) {
      return 'Must be characters.';
    }
    return null;
  }

  Future<void> _pickDate(BuildContext context) async {
    final initialDate = _selectedDate ?? DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (newDate != null) {
      setState(() {
        _selectedDate = newDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.mode == Mode.creating ? 'Add a Mood' : 'Edit item'),
        titleTextStyle: const TextStyle(fontSize: 20.0, color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 172, 191, 207),
      ),
      backgroundColor: const Color.fromARGB(255, 19, 50, 58),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                initialValue: _enteredTitle,
                decoration: const InputDecoration(
                  label: Text(
                    'Title',
                    style: TextStyle(color: Colors.white),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 12.0),
                ),
                validator: validateTitle,
                onSaved: (value) {
                  _enteredTitle = value!;
                },
                style:
                    const TextStyle(color: Color.fromARGB(255, 141, 141, 141)),
              ),
              const SizedBox(height: 8),
              TextFormField(
                maxLength: 5000,
                initialValue: _enteredNote,
                decoration: const InputDecoration(
                  label: Text(
                    'Note',
                    style: TextStyle(color: Colors.white),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 12.0),
                ),
                validator: validateTitle,
                onSaved: (value) {
                  _enteredNote = value!;
                },
                style:
                    const TextStyle(color: Color.fromARGB(255, 141, 141, 141)),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<MoodCategory>(
                      value: _defaultCategory,
                      dropdownColor: const Color.fromARGB(255, 19, 50, 58),
                      items: [
                        for (final category in MoodCategory.values)
                          DropdownMenuItem<MoodCategory>(
                            value: category,
                            child: Row(
                              children: [
                                Icon(category.icon,
                                    size: 20, color: category.color), // Set icon color based on category
                                const SizedBox(width: 10),
                                Text(
                                  category.label,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _defaultCategory = value!;
                        });
                      },
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 8.0),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _pickDate(context),
                      child: InputDecorator(
                        decoration: const InputDecoration(
                          suffixIcon:
                              Icon(Icons.calendar_today, color: Colors.white),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 8.0),
                        ),
                        child: Text(
                          _selectedDate == null
                              ? 'Select Date'
                              : DateFormat.yMd().format(_selectedDate!),
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 181, 193, 204),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: _resetForm,
                    child: const Text(
                      'Reset',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 172, 191, 207),
                    ),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: _saveItem,
                    child: Text(
                      widget.mode == Mode.creating ? 'Add' : 'Changes',
                      style: const TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 172, 191, 207),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
