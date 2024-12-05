import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  final List<Map<String, String>> newsArticles = [
    {
      'title': 'New Eco-Friendly Building Materials Introduced',
      'description':
          'Research shows that using geo-polymer concrete reduces carbon footprint by up to 80%.',
      'date': 'Nov 14, 2024',
    },
    {
      'title': 'Government Incentives for Green Construction',
      'description':
          'Tax benefits now available for builders using sustainable materials and energy-efficient designs.',
      'date': 'Nov 10, 2024',
    },
    {
      'title': 'Recycling in Construction Gains Popularity',
      'description':
          'Construction companies are now recycling 50% of waste materials, reducing landfill impact.',
      'date': 'Nov 8, 2024',
    },
    // Add more news articles as needed
  ];

  NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latest News'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: newsArticles.length,
        itemBuilder: (context, index) {
          return _buildNewsCard(newsArticles[index]);
        },
      ),
    );
  }

  // Widget for each news article card
  Widget _buildNewsCard(Map<String, String> article) {
    return Card(
      color: Colors.green[50],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              article['title']!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              article['description']!,
              style: const TextStyle(color: Colors.black87),
            ),
            const SizedBox(height: 5),
            Text(
              article['date']!,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
