import 'package:flutter/material.dart';
import '../widgets/profile_items_menu.dart';
import '../../../core/constants/app_text_styles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Profile Header
              Row(
                children: [
                  const CircleAvatar(
                    radius: 32,
                    backgroundImage: NetworkImage('placeholder_url'),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('John Doe', style: AppTextStyles.heading2),
                      Text(
                        'john@example.com',
                        style: AppTextStyles.bodyLight,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Menu Items
              const ProfileMenuItem(
                icon: Icons.person_outline,
                title: 'Personal Data',
              ),
              const ProfileMenuItem(
                icon: Icons.settings_outlined,
                title: 'Settings',
              ),
              const ProfileMenuItem(
                icon: Icons.bookmark_outline,
                title: 'Saved Items',
              ),
              const ProfileMenuItem(
                icon: Icons.help_outline,
                title: 'Help Center',
              ),

              const SizedBox(height: 32),
              
              // Sign Out Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text('Sign Out'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}