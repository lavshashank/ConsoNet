import 'package:flutter/material.dart';
import 'home_page.dart'; // Make sure to import your HomePage here

class ResultPage extends StatelessWidget {
  final int totalScore;
  final List<Map<String, Object>> questions;

  const ResultPage({super.key, required this.totalScore, required this.questions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sustainability Results', style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22, color: Colors.white
        ),),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Sustainability Score: $totalScore%',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            const SizedBox(height: 20),
            const Text(
              'Here are suggestions for making your construction more sustainable:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: questions.map((question) {
                  String selectedOption = '';
                  String suggestion = '';

                  // Check if 'options' is not null before accessing 'keys'
                  var options = question['options'] as Map<String, int>?;
                  if (options != null) {
                    for (var option in options.entries) {
                      if (option.value == 0) {
                        selectedOption = option.key;
                        suggestion = 'Consider using ${options.keys.last} for a sustainable alternative';
                      }
                    }
                  }

                  return Card(
                    color: Colors.green[50],
                    child: ListTile(
                      title: Text(selectedOption, style: TextStyle(color: Colors.red[700])),
                      subtitle: Text(suggestion),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigate back to the HomePage
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                        (route) => false, // Removes all previous routes from the stack
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text(
                  'Back to Home Page',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}