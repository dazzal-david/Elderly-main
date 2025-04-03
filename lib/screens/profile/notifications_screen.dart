import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool _medicationReminders = true;
  bool _appointmentReminders = true;
  bool _emergencyAlerts = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: ListView(
        children: [
          _buildSectionHeader('Reminders'),
          SwitchListTile(
            title: const Text('Medication Reminders'),
            subtitle: const Text('Get notified when it\'s time to take medications'),
            value: _medicationReminders,
            onChanged: (bool value) {
              setState(() {
                _medicationReminders = value;
              });
            },
          ),
          const Divider(),
          SwitchListTile(
            title: const Text('Appointment Reminders'),
            subtitle: const Text('Get notified about upcoming appointments'),
            value: _appointmentReminders,
            onChanged: (bool value) {
              setState(() {
                _appointmentReminders = value;
              });
            },
          ),
          _buildSectionHeader('Alerts'),
          SwitchListTile(
            title: const Text('Emergency Alerts'),
            subtitle: const Text('Get notified about emergency situations'),
            value: _emergencyAlerts,
            onChanged: (bool value) {
              setState(() {
                _emergencyAlerts = value;
              });
            },
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
}