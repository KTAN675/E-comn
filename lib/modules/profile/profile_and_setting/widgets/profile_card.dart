import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constant/app_colors.dart';
import '../../../../constant/app_text_styles.dart';
import '../../../theme/theme_controller.dart';
import '../../subscription/subscription_view.dart';
import '../profile_and_setting_controller.dart';
import 'edit_profile_view.dart';

class ProfileWithSubscription extends StatelessWidget {
  final VoidCallback? onSubscriptionTap;

  const ProfileWithSubscription({
    super.key,
    this.onSubscriptionTap,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (theme) {

        final Color accent = theme.currentAccent; // ✅ Dynamic accent

        return GetBuilder<ProfileAndSettingController>(
          builder: (ctrl) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: accent, // ✅ Dynamic
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    // Profile Row
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 32,
                          backgroundColor: Colors.grey[300],
                          backgroundImage: ctrl.profileImage != null
                              ? FileImage(ctrl.profileImage!)
                              : null,
                          child: ctrl.profileImage == null
                              ? const Icon(Icons.person,
                              size: 36, color: Colors.grey)
                              : null,
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ctrl.nameController.text,
                                style: AppTextStyles.h3
                                    .copyWith(color: AppColors.white),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                ctrl.emailController.text,
                                style: AppTextStyles.caption.copyWith(
                                  color: AppColors.white.withOpacity(0.85),
                                ),
                              ),
                              const SizedBox(height: 8),

                              // Edit Profile
                              GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: () {
                                  Get.to(() => const EditProfileView());
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Text(
                                      'Edit Profile',
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(width: 4),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: 14,
                                      color: AppColors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    Divider(
                      color: AppColors.white.withOpacity(0.5),
                      thickness: 0.5,
                    ),

                    /// Subscription
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        Get.to(() => const SubscriptionView());
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Subscription',
                              style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: AppColors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}