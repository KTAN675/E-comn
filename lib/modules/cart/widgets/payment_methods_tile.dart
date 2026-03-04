import 'package:flutter/material.dart';
import '../../../constant/app_colors.dart';
import '../../../constant/app_text_styles.dart';

class PaymentMethodTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String icon;
  final bool selected;
  final VoidCallback onTap;

  const PaymentMethodTile({
    super.key,
    required this.title,
    this.subtitle,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          children: [

            /// ICON
            Container(
              width: 48,
              height: 48,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.border),
              ),
              child: Image.asset(icon),
            ),

            const SizedBox(width: 14),

            /// TEXT
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    title,
                    style: AppTextStyles.bodyLarge.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  if (subtitle != null)
                    Text(
                      subtitle!,
                      style: AppTextStyles.bodyGrey,
                    ),
                ],
              ),
            ),

            /// SELECTOR
            Container(
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.primaryOrange,
                  width: 2,
                ),
                color: selected
                    ? AppColors.primaryOrange
                    : Colors.transparent,
              ),
              child: selected
                  ? const Icon(
                Icons.check,
                size: 16,
                color: Colors.white,
              )
                  : null,
            )
          ],
        ),
      ),
    );
  }
}