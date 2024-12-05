import 'package:flutter/material.dart';
import 'result_page.dart';

class SustainabilityTestPage extends StatefulWidget {
  const SustainabilityTestPage({super.key});

  @override
  _SustainabilityTestPageState createState() => _SustainabilityTestPageState();
}

class _SustainabilityTestPageState extends State<SustainabilityTestPage> {
  int score = 0;
  int currentQuestionIndex = 0;
  int? selectedOption;

  final List<Map<String, Object>> questions = [
    {
      'questionText': 'What type of material do you use for bricks?',
      'options': {'Traditional bricks': 0, 'Compressed Earth Blocks': 20},
    },
    {
      'questionText': 'What type of material do you use for cement?',
      'options': {'Traditional Cement': 0, 'Geo-Polymer Cement': 23},
    },
    {
      'questionText': 'Do you use any renewable energy sources?',
      'options': {'No': 0, 'Solar Panels/Photovoltaic Glass': 17},
    },
    {
      'questionText': 'What type of wood do you use?',
      'options': {'Long aged old woods': 0, 'Eucalyptus Wood / Mycelium wood ': 13},
    },
    {
      'questionText': 'Do you use Aluminium Silicon Alloy?',
      'options': {'No, I use Steel Rods': 0, 'Yes': 17},
    },
    {
      'questionText': 'What type of sand mixture you use?',
      'options': {'Only sand': 0, 'Crushed Recycled Glass, Fly Ash and Sand ': 10},
    },
  ];

  void _answerQuestion(int value) {
    setState(() {
      selectedOption = value;
    });
  }

  void _nextQuestion() {
    if (selectedOption != null) {
      setState(() {
        score += selectedOption!;
        selectedOption = null;
        currentQuestionIndex++;
      });
    }
  }

  void _calculateResult() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage(
          totalScore: score,
          questions: questions,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sustainability Test',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (currentQuestionIndex > 0) {
              setState(() {
                currentQuestionIndex--;
                selectedOption = null;
              });
            } else {
              Navigator.pop(context);
            }
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Progress Indicator
            LinearProgressIndicator(
              value: (currentQuestionIndex + 1) / questions.length,
              backgroundColor: Colors.green[100],
              color: Colors.green,
            ),
            const SizedBox(height: 20),

            // Display current question
            Text(
              questions[currentQuestionIndex]['questionText'] as String,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Display options
            Column(
              children: (questions[currentQuestionIndex]['options'] as Map<String, int>).entries.map((option) {
                return Card(
                  color: selectedOption == option.value ? Colors.green[200] : Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                  child: ListTile(
                    title: Text(
                      option.key,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: selectedOption == option.value ? Colors.green[800] : Colors.black87,
                      ),
                    ),
                    onTap: () => _answerQuestion(option.value),
                  ),
                );
              }).toList(),
            ),

            const Spacer(),

            // Navigation Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (currentQuestionIndex > 0)
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        currentQuestionIndex--;
                        selectedOption = null;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text('Back', style: TextStyle(color: Colors.white)),
                  ),
                ElevatedButton(
                  onPressed: currentQuestionIndex < questions.length - 1 ? _nextQuestion : _calculateResult,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text(
                    currentQuestionIndex < questions.length - 1 ? 'Next' : 'Finish',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}