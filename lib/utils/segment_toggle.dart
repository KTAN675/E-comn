import 'package:flutter/material.dart';

import '../constant/app_colors.dart';
import '../constant/app_text_styles.dart';

class ThemeToggle extends StatelessWidget {
  final bool isGrocery;
  final VoidCallback onToggle;

  const ThemeToggle({
    super.key,
    required this.isGrocery,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggle,
      child: Container(
        width: 85,
        height: 32,
        padding: const EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          color: const Color(0xFFF3EDE7),
          borderRadius: BorderRadius.circular(23),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [

            /// 🔹 Label
            AnimatedAlign(
              duration: const Duration(milliseconds: 200),
              alignment:
              isGrocery ? Alignment.centerRight : Alignment.centerLeft,
              child: Text(
                isGrocery ? "Grocery" : "Medicine",
                style: AppTextStyles.body.copyWith(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
            ),

            /// 🔹 Sliding Circular Icon
            AnimatedAlign(
              duration: const Duration(milliseconds: 260),
              curve: Curves.easeInOut,
              alignment:
              isGrocery ? Alignment.centerLeft : Alignment.centerRight,
              child: Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: AppColors.accent,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isGrocery
                      ? Icons.local_grocery_store
                      : Icons.medical_services,
                  size: 14,
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}