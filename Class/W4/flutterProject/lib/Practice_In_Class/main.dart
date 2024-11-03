import 'package:flutter/material.dart';
import 'MyButton.dart';


void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyHomePage('hello 1'),
            MyHomePage('hello 1'),
            MyHomePage('hello 2'),
          ],
        ),
      ),
    ),
  ));
}


