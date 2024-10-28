import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            padding: EdgeInsets.all(50), // Outer padding
            color: Colors.blue[300], // Background color for the outer container
            child: Container(
              margin: EdgeInsets.all(40), // Inner margin
              decoration: BoxDecoration(
                color: Colors.blue[600], // Inner container color
                borderRadius: BorderRadius.circular(20), // Rounded corners
              ),
              child: Center(
                child: Text(
                  'CADT STUDENTS',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
