import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        child: Container(
          color: Colors.grey,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Minimize the Column's height
            children: [
              buildGradientContainer("OOP", Colors.blue[100]!),
              SizedBox(height: 20), // Vertical margin
              buildGradientContainer("DART", Colors.blue[300]!),
              SizedBox(height: 20), // Vertical margin
              buildGradientContainer("FLUTTER", Colors.blue[600]!),
            ],
          ),
        ),
      ),
    ),
  ));
}

Widget buildGradientContainer(String text, Color color) {
  return Container(
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Text(
      text,
      style: TextStyle(fontSize: 20, color: Colors.white),
    ),
  );
}
