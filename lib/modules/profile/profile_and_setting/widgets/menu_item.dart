import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/theme_controller.dart';

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
    return GetBuilder<ThemeController>(
      builder: (theme) {

        final Color accent = theme.currentAccent; // ✅ Dynamic accent

        return InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: Row(
                children: [
                  Icon(icon, color: accent), // ✅ Dynamic
                  const SizedBox(width: 14),
                  Expanded(child: Text(title)),
                  const Icon(Icons.arrow_forward_ios, size: 16),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}