import 'package:flutter/material.dart';

class TipsPage extends StatelessWidget {
  const TipsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sustainability Tips'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildTipCard(
            'Recycle and reuse construction materials.',
            'Salvaging materials reduces waste and conserves resources.',
            Icons.recycling,
            'assets/images/recycling.jpg',
          ),
          _buildTipCard(
            'Incorporate renewable energy like solar panels.',
            'Solar panels are a great way to power your home sustainably.',
            Icons.sunny,
            'assets/images/solar_panel.jpg',
          ),
          _buildTipCard(
            'Use water-saving fixtures.',
            'Low-flow fixtures help reduce water consumption and waste.',
            Icons.water_drop,
            'assets/images/water_saving.jpg',
          ),
          _buildTipCard(
            'Opt for green roofing.',
            'A green roof can help with insulation and reduce stormwater runoff.',
            Icons.grass,
            'assets/images/green_roof.jpg',
          ),
        ],
      ),
    );
  }

  Widget _buildTipCard(String title, String description, IconData icon, String imagePath) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imagePath,
                width: 80,
                height: 80,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(icon, color: Colors.green),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            overflow: TextOverflow.ellipsis, // Handle overflow for title
                          ),
                          maxLines: 2, // Limit title to 2 lines
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.ellipsis, // Handle overflow for description
                    maxLines: 3, // Limit description to 3 lines
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}