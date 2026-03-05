import 'package:flutter/material.dart';
import '../../../utils/segment_toggle.dart';

class BannerSection extends StatelessWidget {
  final String imagePath;

  const BannerSection({
    super.key,
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
        const Positioned(
          top: 16,
          right: 16,
          child: ThemeToggle(),
        ),
      ],
    );
  }
}