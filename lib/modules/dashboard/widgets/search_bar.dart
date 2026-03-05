import 'package:flutter/material.dart';
import '../../../constant/app_colors.dart';
import '../../../constant/app_text_styles.dart';

class SearchBarSection extends StatelessWidget {
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

  const SearchBarSection({
    super.key,
    this.onTap,
    this.onChanged,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final accent = AppColors.accent;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Container(
        height: 54,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: TextField(
          controller: controller,
          onTap: onTap,
          onChanged: onChanged,
          style: AppTextStyles.bodyLarge,
          cursorColor: accent,
          decoration: InputDecoration(
            hintText: "What’s your daily needs?",
            hintStyle: AppTextStyles.bodyGrey,
            border: InputBorder.none,
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Icon(
                Icons.search,
                color: accent,
              ),
            ),
            suffixIconConstraints:
            const BoxConstraints(minWidth: 40, minHeight: 40),
          ),
        ),
      ),
    );
  }
}