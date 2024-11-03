import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: const Text("My Hobbies"),
          backgroundColor: Colors.purple[50],
        ),
        body: const Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            children: [
              HobbyCard(
                title: "Travelling",
                icon: Icons.flight,
                color: Colors.green,
              ),
              SizedBox(height: 10),
              HobbyCard(
                title: "Skating",
                icon: Icons.skateboarding,
                color: Colors.blueGrey,
              ),
              SizedBox(height: 10),
              HobbyCard(
                title: "Photography",
                icon: Icons.camera_alt,
                color: Color.fromARGB(255, 125, 133, 255),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HobbyCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  const HobbyCard({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          const SizedBox(width: 20),
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          )
        ],
      ),
    );
  }
}
