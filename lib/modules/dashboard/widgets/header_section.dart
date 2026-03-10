import 'package:flutter/material.dart';
import '../../../constant/app_colors.dart';
import '../../../constant/app_text_styles.dart';

class HeaderSection extends StatelessWidget {
  final String name;
  final String address;
  final VoidCallback? onLocationTap;   // avatar tap → drawer
  final VoidCallback? onNotificationTap;
  final VoidCallback? onAddressTap;    // address tap → address page

  const HeaderSection({
    super.key,
    required this.name,
    required this.address,
    this.onLocationTap,
    this.onNotificationTap,
    this.onAddressTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          /// 🔹 Profile Image → opens Drawer
          GestureDetector(
            onTap: onLocationTap,
            child: const CircleAvatar(
              radius: 22,
              backgroundImage: AssetImage("assets/images/profile.png"),
            ),
          ),

          const SizedBox(width: 12),

          /// 🔹 Name + Address — split into two separate taps
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// Name row → opens Drawer (same as avatar)
                GestureDetector(
                  onTap: onLocationTap,
                  child: Row(
                    children: [
                      Text(name, style: AppTextStyles.h1),
                      const SizedBox(width: 6),
                      const Text("👋"),
                    ],
                  ),
                ),

                const SizedBox(height: 4),

                /// Address row → navigates to Address page
                GestureDetector(
                  onTap: onAddressTap ?? onLocationTap, // fallback to drawer if not set
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          address,
                          style: AppTextStyles.bodyGrey,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        size: 18,
                        color: AppColors.greyText,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          /// 🔹 Notification Icon
          GestureDetector(
            onTap: onNotificationTap,
            child: Container(
              width: 40,
              height: 40,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.accent.withOpacity(0.1),
              ),
              child: Icon(
                Icons.notifications_none,
                color: AppColors.accent,
                size: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
