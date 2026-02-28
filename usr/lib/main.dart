import 'package:flutter/material.dart';

void main() {
  runApp(const ResumeApp());
}

class ResumeApp extends StatelessWidget {
  const ResumeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Professional Resume',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2C3E50)),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const ResumeScreen(),
      },
    );
  }
}

class ResumeScreen extends StatelessWidget {
  const ResumeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text('Resume'),
        centerTitle: true,
        backgroundColor: const Color(0xFF2C3E50),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: 20),
            _buildSectionTitle(context, 'Summary'),
            _buildSummaryCard(),
            const SizedBox(height: 20),
            _buildSectionTitle(context, 'Skills'),
            _buildSkillsCard(),
            const SizedBox(height: 20),
            _buildSectionTitle(context, 'Languages'),
            _buildLanguagesCard(),
            const SizedBox(height: 20),
            _buildSectionTitle(context, 'Experience'),
            _buildExperienceCard(),
            const SizedBox(height: 20),
            _buildSectionTitle(context, 'Education'),
            _buildEducationCard(),
            const SizedBox(height: 30), // Bottom padding
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: const Icon(Icons.person, size: 50, color: Colors.white),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Name',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF2C3E50),
                        ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Creative Designer & Developer',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.grey[700],
                        ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.email, size: 16, color: Colors.grey),
                      const SizedBox(width: 5),
                      Text('email@example.com', style: TextStyle(color: Colors.grey[600])),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.phone, size: 16, color: Colors.grey),
                      const SizedBox(width: 5),
                      Text('+123 456 7890', style: TextStyle(color: Colors.grey[600])),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
      child: Text(
        title.toUpperCase(),
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2C3E50),
              letterSpacing: 1.2,
            ),
      ),
    );
  }

  Widget _buildSummaryCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Motivated and detail-oriented professional with a strong background in design and development. Passionate about creating user-centric experiences and continuous learning.',
          style: TextStyle(fontSize: 15, height: 1.5),
        ),
      ),
    );
  }

  Widget _buildSkillsCard() {
    // Added 'Design' as requested, plus other relevant skills
    final skills = ['Design', 'UI/UX', 'Flutter', 'Prototyping', 'Creative Thinking', 'Problem Solving'];
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Wrap(
          spacing: 10,
          runSpacing: 10,
          children: skills.map((skill) => Chip(
            label: Text(skill),
            backgroundColor: const Color(0xFFE8F0FE),
            labelStyle: const TextStyle(color: Color(0xFF1967D2), fontWeight: FontWeight.w500),
            side: BorderSide.none,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          )).toList(),
        ),
      ),
    );
  }

  Widget _buildLanguagesCard() {
    // Added requested languages
    final languages = [
      {'name': 'English', 'level': 'Fluent'},
      {'name': 'Telugu', 'level': 'Native'},
      {'name': 'Japanese', 'level': 'Basics'},
    ];

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: languages.map((lang) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(lang['name']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text(lang['level']!, style: TextStyle(color: Colors.grey[600], fontStyle: FontStyle.italic)),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildExperienceCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Senior Designer', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text('Creative Studio Inc. | 2020 - Present', style: TextStyle(color: Colors.grey[600], fontSize: 14)),
            const SizedBox(height: 8),
            const Text('Leading design projects and collaborating with cross-functional teams to deliver high-quality visual solutions.'),
            const Divider(height: 24),
            const Text('Junior Developer', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text('Tech Solutions Ltd. | 2018 - 2020', style: TextStyle(color: Colors.grey[600], fontSize: 14)),
            const SizedBox(height: 8),
            const Text('Assisted in developing mobile applications and maintaining codebases.'),
          ],
        ),
      ),
    );
  }
  
  Widget _buildEducationCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Bachelor of Design', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text('University of Art & Design | 2014 - 2018', style: TextStyle(color: Colors.grey[600], fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
