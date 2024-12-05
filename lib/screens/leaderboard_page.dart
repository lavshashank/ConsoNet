import 'package:flutter/material.dart';

class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leaderboard'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildLeaderboardEntry('User1', 100),
          _buildLeaderboardEntry('User2', 85),
          _buildLeaderboardEntry('User3', 70),
        ],
      ),
    );
  }

  Widget _buildLeaderboardEntry(String name, int score) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        title: Text(name),
        trailing: Text('$score Points', style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}