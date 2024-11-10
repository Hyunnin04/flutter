import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      home: Scaffold(
        body: Center(
            child: Column(
          children: [
            SizedBox(height: 40),
            MyWidget(),
            MyWidget(),
            MyWidget(),
            MyWidget(),
          ],
        )),
      ),
    ));

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool isSelected = false;

  void toggleSelection() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: 400,
      height: 100,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            isSelected = !isSelected;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.blue : Colors.blue[50],
        ),
        child: Text(
          isSelected ? 'Selected' : 'Not Selected',
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
