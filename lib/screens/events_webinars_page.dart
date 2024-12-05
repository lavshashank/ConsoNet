import 'package:flutter/material.dart';

class EventsWebinarsPage extends StatelessWidget {
  const EventsWebinarsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Events & Webinars'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildEventCard('Green Building Webinar', 'Online - Dec 1, 2024'),
          _buildEventCard('Sustainable Materials Expo', 'New York - Jan 15, 2025'),
        ],
      ),
    );
  }

  Widget _buildEventCard(String title, String date) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        title: Text(title),
        subtitle: Text(date),
        trailing: const Icon(Icons.event),
      ),
    );
  }
}