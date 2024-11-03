import 'dart:math';
import 'package:flutter/material.dart';

const List<String> diceImage = [
  'assets/Image/dice-1.png',
  'assets/Image/dice-2.png',
  'assets/Image/dice-3.png',
  'assets/Image/dice-4.png',
  'assets/Image/dice-5.png',
  'assets/Image/dice-6.png',
];

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  int diceValue = 0;
  String activeDiceImage = diceImage[0]; 

  void rollDice() {
    setState(() {
      diceValue = Random().nextInt(6); 
      activeDiceImage = diceImage[diceValue];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: rollDice,
            child: Image.asset(
            activeDiceImage,
            width: 200,
          )
        ),
        const SizedBox(height: 20),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
              fontSize: 28,
            ),
          ),
          child: const Text('Roll Dice'),
        ),
      ],
    );
  }
}

void main() => runApp(const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Center(child: DiceRoller()),
      ),
    ));
