import 'package:flutter/material.dart';
import 'package:test_flutter/W5/W5-S2/EXERCISE-3/screen/welcome.dart';
import 'package:test_flutter/W5/W5-S2/EXERCISE-3/screen/temperature.dart';


class TemperatureApp extends StatefulWidget {
  const TemperatureApp({super.key});

  @override
  State<TemperatureApp> createState() {
    return _TemperatureAppState();
  }
}

class _TemperatureAppState extends State<TemperatureApp> {
  bool _isWelcomeScreen = true;

  void _switchScreen() {
    setState(() {
      _isWelcomeScreen = !_isWelcomeScreen;
    });
  }

  @override
  Widget build(context) {

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff16C062),
                Color(0xff00BCDC),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          // Conditionally render the screen based on `_isWelcomeScreen`.
          child: _isWelcomeScreen
              ? Welcome(onStart: _switchScreen)
              : Temperature(onBack: _switchScreen),
        ),
      ),
    );
  }
}

void main() {
  runApp(const TemperatureApp());
}
