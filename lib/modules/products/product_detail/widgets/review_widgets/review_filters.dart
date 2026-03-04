import 'package:flutter/material.dart';
import '../../../../../constant/app_colors.dart';
import '../../../../../constant/app_text_styles.dart';


class ReviewFilters extends StatelessWidget {
  const ReviewFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: const [

        _FilterChip(
          title: "All Reviews",
          active: true,
        ),

        _FilterChip(
          title: "With Photo & Video",
        ),

        _FilterChip(
          title: "With Description",
        ),
      ],
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String title;
  final bool active;

  const _FilterChip({
    required this.title,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: active
              ? AppColors.primaryOrange
              : Colors.grey.shade400,
          width: 1.4,
        ),
      ),
      child: Text(
        title,
        style: AppTextStyles.body.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}