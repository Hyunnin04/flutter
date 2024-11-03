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
        appBar: AppBar(
          title: const Text('Custom Buttons'),
        ),
        body: const Center(
          child: ButtonList(),
        ),
      ),
    );
  }
}

class ButtonList extends StatelessWidget {
  const ButtonList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:  [
        CustomButton(
          label: 'Submit',
          icon: Icons.check,
          color: Colors.blue, 
        ),
        SizedBox(height: 20),
        CustomButton(
          label: 'Time',
          icon: Icons.access_time,
          color: Colors.green, 
        ),
        SizedBox(height: 20),
        CustomButton(
          label: 'Account',
          icon: Icons.account_circle,
          color: Colors.grey, 
        ),
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;

  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    required this.color, 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800, 
      height: 50, 
      decoration: BoxDecoration(
        color: color, 
        borderRadius: BorderRadius.circular(8), 
      ),
      child: TextButton.icon(
        onPressed: () {
        
        },
        icon: Icon(icon, color: Colors.white),
        label: Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
