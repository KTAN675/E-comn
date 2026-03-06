import 'package:flutter/material.dart';
import '../../../../constant/app_colors.dart';
import '../../../../constant/app_text_styles.dart';


class PaymentTile extends StatelessWidget {
  final Widget leading;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  const PaymentTile({
    super.key,
    required this.leading,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        padding: const EdgeInsets.all(18),

        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
        ),

        child: Row(
          children: [

            leading,

            const SizedBox(width: 16),

            /// TITLE + SUBTITLE
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

                  if (subtitle != null) ...[
                    const SizedBox(height: 4),

                    Text(
                      subtitle!,
                      style: AppTextStyles.bodyGrey.copyWith(
                        fontSize: 13,
                      ),
                    ),
                  ]
                ],
              ),
            ),

            if (trailing != null) trailing!,
          ],
        ),
      ),
    );
  }
}