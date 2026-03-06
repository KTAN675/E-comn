import 'package:flutter/material.dart';
import '../../../../constant/app_text_styles.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 12,
        top: 20,
      ),

      child: Text(
        title,
        style: AppTextStyles.h2.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}