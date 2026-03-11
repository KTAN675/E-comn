import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constant/app_colors.dart';
import '../../../theme/theme_controller.dart';

class TopicCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const TopicCard({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (theme) {

        final Color accent = theme.currentAccent; // ✅ Dynamic accent

        return Container(
          decoration: BoxDecoration(
            color: accent, // ✅ Dynamic
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(icon, color: accent), // ✅ Dynamic
              ),
              const SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}