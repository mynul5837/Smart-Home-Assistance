import 'package:flutter/material.dart';
import 'package:smart_home_flutter_ui/constants/app_colors.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<FAQItem> filteredFAQs = [];

  @override
  void initState() {
    super.initState();
    filteredFAQs = faqList;
  }

  void filterFAQs(String query) {
    setState(() {
      filteredFAQs = faqList
          .where((faq) =>
              faq.question.toLowerCase().contains(query.toLowerCase()) ||
              faq.answer.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.fg1Color,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Help Center',
          style: TextStyle(color: AppColor.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColor.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              onChanged: filterFAQs,
              style: const TextStyle(color: AppColor.white),
              decoration: InputDecoration(
                hintText: 'Search for help...',
                hintStyle: const TextStyle(color: Colors.white70),
                prefixIcon: const Icon(Icons.search, color: Colors.white70),
                filled: true,
                fillColor: Colors.white.withOpacity(0.1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 20,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                const HelpCategory(
                  icon: Icons.home_outlined,
                  title: 'Quick Start Guide',
                ),
                const SizedBox(height: 20),
                const Text(
                  'Frequently Asked Questions',
                  style: TextStyle(
                    color: AppColor.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                ...filteredFAQs.map((faq) => FAQExpansionTile(faq: faq)),
                const SizedBox(height: 20),
                ContactSupportCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HelpCategory extends StatelessWidget {
  final IconData icon;
  final String title;

  const HelpCategory({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColor.white, size: 30),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColor.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Learn the basics of Smart Home Assistance',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, color: AppColor.white),
        ],
      ),
    );
  }
}

class FAQExpansionTile extends StatelessWidget {
  final FAQItem faq;

  const FAQExpansionTile({super.key, required this.faq});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.1),
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ExpansionTile(
        title: Text(
          faq.question,
          style: const TextStyle(color: AppColor.white),
        ),
        iconColor: AppColor.white,
        collapsedIconColor: AppColor.white,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              faq.answer,
              style: const TextStyle(color: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }
}

class ContactSupportCard extends StatelessWidget {
  const ContactSupportCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue.withOpacity(0.3),
            Colors.purple.withOpacity(0.3),
          ],
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Need More Help?',
            style: TextStyle(
              color: AppColor.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Contact our support team for personalized assistance',
            style: TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: AppColor.fg1Color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Text('Contact Support'),
            ),
          ),
        ],
      ),
    );
  }
}

class FAQItem {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});
}

final List<FAQItem> faqList = [
  FAQItem(
    question: 'How do I add a new device?',
    answer: 'To add a new device, go to the Devices section and tap the "+" button. Follow the on-screen instructions to connect your device to the network.',
  ),
  FAQItem(
    question: 'How can I create automation routines?',
    answer: 'Navigate to the Settings screen and select "Automation". Here you can create custom routines based on time, device status, or other triggers.',
  ),
  FAQItem(
    question: 'What should I do if a device is offline?',
    answer: 'First, check if the device is powered on and within range of your WiFi network. Try restarting the device and your router if issues persist.',
  ),
  FAQItem(
    question: 'How do I manage user access?',
    answer: 'Go to the Manage Users section to add, remove, or modify user permissions. You can set different access levels for each user.',
  ),
  FAQItem(
    question: 'Can I control devices when I\'m away from home?',
    answer: 'Yes! As long as your phone has an internet connection, you can control your smart home devices from anywhere.',
  ),
];