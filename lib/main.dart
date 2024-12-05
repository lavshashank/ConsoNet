import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(const ConsoNet());
}

class ConsoNet extends StatelessWidget {
   const ConsoNet({super.key});

  @override  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(), // Start with Login Screen
    );
  }
}