import 'package:flutter/material.dart';
import '../../../constant/app_colors.dart';
import '../../../constant/app_text_styles.dart';
import '../../../utils/segment_toggle.dart';

class CategoryHeader extends StatelessWidget {
  final VoidCallback? onBack;

  const CategoryHeader({
    super.key,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [

          /// 🔹 Back Button
          GestureDetector(
            onTap: onBack ?? () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back,
              size: 22,
              color: AppColors.black,
            ),
          ),

          const SizedBox(width: 16),

          /// 🔹 Title
          Expanded(
            child: Center(
              child: Text(
                "Categories",
                style: AppTextStyles.h1.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          /// 🔹 Theme Toggle
          // const ThemeToggle(),
        ],
      ),
    );
  }
}