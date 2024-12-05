import 'package:flutter/material.dart';
import 'home_page.dart'; // Import your actual HomePage

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    // Delay for 3 seconds and then navigate to the home page
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) =>  HomePage()), // Use your existing HomePage
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App logo or icon (e.g., sustainability symbol)
            const Icon(
              Icons.eco, // Use an appropriate sustainability icon
              size: 100.0,
              color: Colors.green,
            ),
            const SizedBox(height: 20.0),

            // App title
            Text(
              'Welcome to EcoBuild',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Colors.green[800],
              ),
            ),
            const SizedBox(height: 10.0),

            // Subtitle or tagline
            Text(
              'Sustainable Solutions for Construction',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.green[700],
              ),
            ),
            const SizedBox(height: 40.0),

            // Loading animation
            FadeTransition(
              opacity: _controller,
              child: Icon(
                Icons.recycling,
                color: Colors.green[600],
                size: 50.0,
              ),
            ),
            const SizedBox(height: 20.0),

            // Additional loading text
            Text(
              'Loading...',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.green[800],
              ),
            ),
          ],
        ),
      ),
    );
  }
}