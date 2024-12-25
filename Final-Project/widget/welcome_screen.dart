import 'package:flutter/material.dart';
import 'package:test_flutter/Final-Project/widget/homeScreen_list.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 19, 50, 58),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "WELCOME BACK",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Image.asset(
              'assets/project/logo.png',
              width: 300,
            ),
            const SizedBox(height: 10),
            const Text(
              'How are you today?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              label: const Text("GET STARTED"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 172, 191, 207),
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 16),
                textStyle: const TextStyle(
                  fontSize: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
