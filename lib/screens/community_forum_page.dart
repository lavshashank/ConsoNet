import 'package:flutter/material.dart';

class CommunityForumPage extends StatelessWidget {
  const CommunityForumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community Forum'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text('Community Forum Coming Soon!', style: TextStyle(fontSize: 18)),
      ),
    );
  }
}