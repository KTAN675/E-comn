import 'package:flutter/material.dart';
import '../../../constant/app_colors.dart';
import '../../../constant/app_text_styles.dart';
import '../../../utils/segment_toggle.dart';

class BannerSection extends StatelessWidget {
  final bool isGrocery;
  final VoidCallback onToggle;
  final String imagePath;

  const BannerSection({
    super.key,
    required this.isGrocery,
    required this.onToggle,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          imagePath,
          width: double.infinity,
          fit: BoxFit.cover,
        ),

        Positioned(
          top: 16,
          right: 16,
          child: ThemeToggle(
            isGrocery: isGrocery,
            onToggle: onToggle,
          ),
        ),
      ],
    );
  }
}