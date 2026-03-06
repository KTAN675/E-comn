import 'package:flutter/material.dart';
import '../../../../constant/app_colors.dart';
import '../../../../constant/app_text_styles.dart';


class AmountChip extends StatelessWidget {
  final int amount;
  final bool isSelected;
  final VoidCallback onTap;

  const AmountChip({
    super.key,
    required this.amount,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final accent = AppColors.accent;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 14),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.lightAccent
                  : AppColors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: isSelected
                    ? accent
                    : AppColors.border,
              ),
            ),
            child: Text(
              "₹$amount",
              style: AppTextStyles.bodyLarge.copyWith(
                fontWeight: FontWeight.w600,
                color: isSelected ? accent : AppColors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}