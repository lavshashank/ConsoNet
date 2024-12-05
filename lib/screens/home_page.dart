import 'package:flutter/material.dart';
import 'login_page.dart';
import 'case_studies_page.dart';
import 'tips_page.dart';
import 'leaderboard_page.dart';
import 'events_webinars_page.dart';
import 'community_forum_page.dart';
import 'news_page.dart';
import 'sustainability_test_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ConsoNet - Sustainable Solutions',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      drawer: _buildDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderImage(),
            _buildInfo(),
            _buildNewsPreview(context),
            _buildSustainabilityTestCard(context),
          ],
        ),
      ),
    );
  }

  // Drawer widget for navigation
  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.eco, color: Colors.white, size: 50),
                SizedBox(height: 10),
                Text(
                  'ConsoNet Menu',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ],
            ),
          ),
          _buildDrawerItem(
              context, Icons.person, 'User Profile', const LoginPage()),
          _buildDrawerItem(context, Icons.bookmark, 'Bookmarks', null),
          _buildDrawerItem(context, Icons.leaderboard, 'Leaderboard',
              const LeaderboardPage()),
          _buildDrawerItem(context, Icons.library_books, 'Case Studies',
              const CaseStudiesPage()),
          _buildDrawerItem(context, Icons.lightbulb, 'Tips', const TipsPage()),
          _buildDrawerItem(context, Icons.event, 'Events & Webinars',
              const EventsWebinarsPage()),
          _buildDrawerItem(context, Icons.forum, 'Community Forum',
              const CommunityForumPage()),
          _buildDrawerItem(
            context,
            Icons.eco,
            'Sustainability Test',
            const SustainabilityTestPage(),
          ),
        ],
      ),
    );
  }

  // Helper function to create drawer list items
  Widget _buildDrawerItem(
      BuildContext context, IconData icon, String title, Widget? destination) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        if (destination != null) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => destination));
        }
      },
    );
  }

  // Info section about sustainable construction
  Widget _buildInfo() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: Colors.green[50],
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'What is Sustainable Construction?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Sustainable construction involves designing, building, and operating structures in ways that reduce environmental impact. This includes using eco-friendly materials, improving energy efficiency, managing waste responsibly, and integrating renewable energy sources.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Header Image
  Widget _buildHeaderImage() {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/main_screen.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // Sustainability Test Card
  Widget _buildSustainabilityTestCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        color: Colors.green[50],
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const SustainabilityTestPage()),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.eco, color: Colors.green, size: 60),
                const SizedBox(height: 10),
                Text(
                  'Calculate the Sustainability of Your Construction',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[800],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // News Preview Section
  Widget _buildNewsPreview(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Latest News on Sustainable Construction',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
          ),
          const SizedBox(height: 10),
          ...newsArticles
              .take(2)
              .map((article) => _buildNewsCard(article))
              .toList(),
          const SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NewsPage()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              child: const Text(
                'View All News',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Individual News Card
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
