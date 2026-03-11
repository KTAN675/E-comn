import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constant/app_colors.dart';
import '../../../../constant/app_text_styles.dart';
import '../../../theme/theme_controller.dart';

class LogoutButton extends StatelessWidget {
  final VoidCallback onTap;

  const LogoutButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (theme) {

        final Color accent = theme.currentAccent; // ✅ Dynamic accent

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: InkWell(
            onTap: onTap,
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: accent.withOpacity(0.15), // ✅ Dynamic
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.logout,
                    color: accent, // ✅ Dynamic
                    size: 20,
                  ),
                ),
                const SizedBox(width: 14),
                Text(
                  'Log Out',
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: AppColors.dangerRed, // ✅ kept red (danger color)
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}