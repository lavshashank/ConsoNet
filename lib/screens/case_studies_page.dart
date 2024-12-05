import 'package:flutter/material.dart';

class CaseStudiesPage extends StatelessWidget {
  const CaseStudiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Case Studies'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildCaseStudyCard(
            'Green Building in Singapore',
            'Energy-efficient design and renewable materials.',
            'https://www.novatr.com/blog/green-architecture-buildings-singapore',
          ),
          _buildCaseStudyCard(
            'Net-Zero Home in California',
            'Uses solar panels and energy storage to eliminate energy bills.',
            'https://homeownershipmatters.realtor/california/california-is-making-net-zero-homes-the-new-standard/',
          ),
          _buildCaseStudyCard(
            'Recycled Materials Project',
            'Building using recycled glass and plastic bricks.',
            'https://www.habitusliving.com/articles/reclaimed-construction-top-ten-sustainable-building-materials',
          ),
        ],
      ),
    );
  }

  Widget _buildCaseStudyCard(String title, String description, String link) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () {},
      ),
    );
  }
}
