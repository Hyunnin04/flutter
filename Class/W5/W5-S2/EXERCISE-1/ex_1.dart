import 'package:flutter/material.dart';

List<String> colors = ["red", "blue", "green"];

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(children: [
          const Label("Method 1: Loop in Array", bold: true),
          for (var color in colors) Text(color),
          const Text("________________________________________________"),
          const Label("Method 2: Map", bold: true),
          ...colors.map((color) => Text(color)).toList(),
          const Text("________________________________________________"),
          const Label("Method 3: Dedicated Function", bold: true),
          ...getColorWidgets(),
          const Text("________________________________________________"),
        ]),
      ),
    ),
  ));
}

// Dedicated Function
List<Widget> getColorWidgets() {
  return colors.map((color) => Text(color)).toList();
}

class Label extends StatelessWidget {
  const Label(this.text, {super.key, this.bold = false});

  final bool bold;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(fontWeight: (bold ? FontWeight.bold : FontWeight.normal)),
    );
  }
}
