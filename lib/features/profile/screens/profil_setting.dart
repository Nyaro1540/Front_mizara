import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF101010)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Color(0xFF101010),
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: const SettingsContent(),
    );
  }
}

class SettingsContent extends StatefulWidget {
  const SettingsContent({super.key});

  @override
  State<SettingsContent> createState() => _SettingsContentState();
}

class _SettingsContentState extends State<SettingsContent> {
  bool pushNotifications = false;
  bool location = true;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      children: [
        // PROFILE Section
        const Text(
          'PROFILE',
          style: TextStyle(
            color: Color(0xFF878787),
            fontSize: 14,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 16),

        // Push Notifications
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text(
            'Push Notification',
            style: TextStyle(
              color: Color(0xFF101010),
              fontSize: 16,
            ),
          ),
          value: pushNotifications,
          onChanged: (value) => setState(() => pushNotifications = value),
          activeColor: const Color(0xFFfe8c00),
          inactiveTrackColor: const Color(0xFFdfe0f3),
        ),

        // Location
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text(
            'Location',
            style: TextStyle(
              color: Color(0xFF101010),
              fontSize: 16,
            ),
          ),
          value: location,
          onChanged: (value) => setState(() => location = value),
          activeColor: const Color(0xFFfe8c00),
          inactiveTrackColor: const Color(0xFFdfe0f3),
        ),

        // Language
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text(
            'Language',
            style: TextStyle(
              color: Color(0xFF101010),
              fontSize: 16,
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                'English',
                style: TextStyle(
                  color: Color(0xFF878787),
                  fontSize: 16,
                ),
              ),
              SizedBox(width: 4),
              Icon(
                Icons.arrow_forward_ios,
                color: Color(0xFF878787),
                size: 16,
              ),
            ],
          ),
          onTap: () {},
        ),

        const SizedBox(height: 32),

        // OTHER Section
        const Text(
          'OTHER',
          style: TextStyle(
            color: Color(0xFF878787),
            fontSize: 14,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 16),

        // About Ticketis
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text(
            'About Ticketis',
            style: TextStyle(
              color: Color(0xFF101010),
              fontSize: 16,
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: Color(0xFF878787),
            size: 16,
          ),
          onTap: () {},
        ),

        // Privacy Policy
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text(
            'Privacy Policy',
            style: TextStyle(
              color: Color(0xFF101010),
              fontSize: 16,
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: Color(0xFF878787),
            size: 16,
          ),
          onTap: () {},
        ),

        // Terms and Conditions
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text(
            'Terms and Conditions',
            style: TextStyle(
              color: Color(0xFF101010),
              fontSize: 16,
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: Color(0xFF878787),
            size: 16,
          ),
          onTap: () {},
        ),
      ],
    );
  }
}
