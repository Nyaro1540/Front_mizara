import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: AppColors.text),
          title: Text(title, style: AppTextStyles.body),
          trailing: const Icon(
            Icons.chevron_right,
            color: AppColors.textLight,
          ),
          onTap: onTap,
        ),
        const Divider(),
      ],
    );
  }
}
