import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:test_flutter/Final-Project/data/dummyMoods.dart';
import 'package:test_flutter/Final-Project/models/mood_category.dart'; 

class MoodAnalysisScreen extends StatelessWidget {
  const MoodAnalysisScreen({super.key});
  List<PieChartSectionData> generatePieChartData() {
    Map<int, int> categoryCounts = {};
    for (var mood in dummyMoods) {
      categoryCounts[mood.category.index] = (categoryCounts[mood.category.index] ?? 0) + 1;
    }

    return categoryCounts.entries.map((entry) {
      final categoryIndex = entry.key; 
      final count = entry.value; 
      return PieChartSectionData(
        color: MoodCategory.values[categoryIndex].color, 
        value: count.toDouble(), 
        title: '${(count / dummyMoods.length * 100).toStringAsFixed(1)}%',
        radius: 50, 
        titleStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white), // Set the title style
      );
    }).toList();
  }

  List<Widget> generateLegend() {
    List<Widget> legend = [];
    for (var category in MoodCategory.values) {
      legend.add(Row(
        children: [
          Container(
            width: 16, 
            height: 16, 
            color: category.color,
          ),
          const SizedBox(width: 8), 
          Text(category.label, style: const TextStyle(fontSize: 16, color: Colors.white)), // Set the text style
        ],
      ));
    }
    return legend;
  }
  @override
  Widget build(BuildContext context) {
    List<PieChartSectionData> dataSections = generatePieChartData();
    List<Widget> legend = generateLegend();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mood Analysis',
        style: TextStyle(color: Colors.white),),
        backgroundColor: const Color.fromARGB(255, 172, 191, 207),
      ),
      body: Container(
        color: const Color.fromARGB(255, 19, 50, 58), 
        padding: const EdgeInsets.all(16.0), 
        child: Column(
          children: [
            Expanded(
              child: PieChart(
                PieChartData(
                  sections: dataSections, 
                  sectionsSpace: 2, 
                  centerSpaceRadius: 50, 
                ),
              ),
            ),
            const SizedBox(height: 16),
            Column(
              children: legend, // Add legend items
            ),
          ],
        ),
      ),
    );
  }
}
