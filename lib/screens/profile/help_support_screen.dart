import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  Future<void> _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Support'),
      ),
      body: ListView(
        children: [
          _buildSectionHeader('Frequently Asked Questions'),
          _buildExpansionTile(
            'How do I add a medication?',
            'To add a medication, go to the Medications screen and tap the + button '
            'in the top right corner. Fill in the medication details and tap Save.',
          ),
          _buildExpansionTile(
            'How do I edit my profile?',
            'To edit your profile, go to the Profile screen and tap the edit (pencil) '
            'icon in the top right corner. Update your information and tap Save.',
          ),
          _buildExpansionTile(
            'How do medication reminders work?',
            'Medication reminders are notifications that appear at scheduled times '
            'to remind you to take your medications. You can set these times when '
            'adding or editing a medication.',
          ),
          const Divider(height: 32),
          _buildSectionHeader('Contact Support'),
          ListTile(
            leading: const Icon(Icons.email_outlined),
            title: const Text('Email Support'),
            subtitle: const Text('athulraj666@gmail.com'),
            onTap: () => _launchUrl('mailto:athulraj666@gmail.com'),
          ),
          ListTile(
            leading: const Icon(Icons.phone_outlined),
            title: const Text('Call Support'),
            subtitle: const Text('+91 7909179436'),
            onTap: () => _launchUrl('tel:+917909179436'),
          ),
          const Divider(height: 32),
          _buildSectionHeader('App Information'),
          const ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('App Version'),
            subtitle: Text('1.0.0'),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _buildExpansionTile(String title, String content) {
    return ExpansionTile(
      title: Text(title),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Text(content),
        ),
      ],
    );
  }
}