import 'package:e_comm/modules/profile/profile_and_setting/widgets/logout_button.dart';
import 'package:e_comm/modules/profile/profile_and_setting/widgets/menu_item.dart';
import 'package:e_comm/modules/profile/profile_and_setting/widgets/profile_card.dart';
import 'package:e_comm/modules/profile/profile_and_setting/widgets/wallet_rewards.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant/app_colors.dart';
import '../../../constant/app_text_styles.dart';
import '../../../routes/app_routes.dart';
import 'profile_and_setting_controller.dart';

class ProfileAndSettingView extends GetView<ProfileAndSettingController> {
  const ProfileAndSettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.black),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
        title: Text('Profile', style: AppTextStyles.h2),
      ),
      body: GetBuilder<ProfileAndSettingController>(
        builder: (ctrl) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 8),

                /// 🔹 Profile Card
                ProfileWithSubscription(key: key),

                const SizedBox(height: 12),

                /// 🔹 Subscription Banner
             //   const SubscriptionBanner(),

                const SizedBox(height: 12),

                /// 🔹 Wallet & Rewards
                WalletRewardsRow(ctrl: ctrl),

                const SizedBox(height: 8),

                /// 🔹 Menu Items
                ProfileMenuItem(
                  icon: Icons.center_focus_weak,
                  title: 'Payment Method',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  icon: Icons.shopping_bag_outlined,
                  title: 'Past Orders',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  icon: Icons.notifications_none_outlined,
                  title: 'Notification',
                  onTap: () =>
                      Get.toNamed(AppRoutes.notification),
                ),
                ProfileMenuItem(
                  icon: Icons.help_outline,
                  title: 'Help & Support',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  icon: Icons.map,
                  title: 'Saved Address',
                  onTap: () {},
                ),

                const SizedBox(height: 16),

                /// 🔹 Logout
                LogoutButton(
                  onTap: ctrl.logout,
                ),

                const SizedBox(height: 32),
              ],
            ),
          );
        },
      ),
    );
  }
}