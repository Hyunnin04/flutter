import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage(this.title, {super.key});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(50),
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF519CF1), Color(0xFFC13C3C)]),
          borderRadius: BorderRadius.circular(30)),
      child:  Text(
        title,
        style: const TextStyle(
            fontSize: 35.0,
            fontWeight: FontWeight.w700,
            color: Colors.white,
            decoration: TextDecoration.none),
      ),
    );
  }
}
