import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/app_colors.dart';
import '../../constant/app_text_styles.dart';
import '../../routes/app_routes.dart';
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
                _buildProfileCard(ctrl),

                const SizedBox(height: 12),

                /// 🔹 Subscription Banner
                _buildSubscriptionBanner(),

                const SizedBox(height: 12),

                /// 🔹 Wallet & Rewards Row
                _buildWalletRewardsRow(ctrl),

                const SizedBox(height: 8),

                /// 🔹 Menu Items
                _buildMenuItem(
                  icon: Icons.account_balance_wallet_outlined,
                  title: 'Payment Method',
                  onTap: () {},
                ),
                _buildMenuItem(
                  icon: Icons.check_box_outlined,
                  title: 'Past Orders',
                  onTap: () {},
                ),
                _buildMenuItem(
                  icon: Icons.notifications_none_outlined,
                  title: 'Notification',
                  onTap: () => Get.toNamed(AppRoutes.notificationSettings),
                ),
                _buildMenuItem(
                  icon: Icons.help_outline,
                  title: 'Help & Support',
                  onTap: () {},
                ),
                _buildMenuItem(
                  icon: Icons.bookmark_border,
                  title: 'Saved Address',
                  onTap: () {},
                ),

                const SizedBox(height: 16),

                /// 🔹 Log Out
                _buildLogoutButton(ctrl),

                const SizedBox(height: 32),
              ],
            ),
          );
        },
      ),
    );
  }

  // =============================
  // PROFILE CARD
  // =============================

  Widget _buildProfileCard(ProfileAndSettingController ctrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.primaryOrange,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            // Avatar
            CircleAvatar(
              radius: 32,
              backgroundColor: AppColors.white,
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey[300],
                child: const Icon(Icons.person, size: 36, color: Colors.grey),
              ),
            ),
            const SizedBox(width: 14),
            // Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ctrl.nameController.text,
                    style: AppTextStyles.h3.copyWith(color: AppColors.white),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    ctrl.emailController.text,
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.white.withValues(alpha:0.85),
                    ),
                  ),
                  const SizedBox(height: 6),
                  GestureDetector(
                    onTap: () => Get.toNamed(AppRoutes.editProfile),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Edit Profile',
                          style: AppTextStyles.caption.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 12,
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
      ),
    );
  }

  // =============================
  // SUBSCRIPTION BANNER
  // =============================

  Widget _buildSubscriptionBanner() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.flashSale,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Subscription',
              style: AppTextStyles.bodyLarge.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: AppColors.white,
            ),
          ],
        ),
      ),
    );
  }

  // =============================
  // WALLET & REWARDS
  // =============================

  Widget _buildWalletRewardsRow(ProfileAndSettingController ctrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          // Wallet Money
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF3E0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.account_balance_wallet,
                      color: AppColors.primaryOrange,
                      size: 22,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Wallet Money',
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        ctrl.walletBalance,
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.primaryOrange,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Rewards
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF8E1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 22,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Rewards',
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        ctrl.rewardsCount,
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.primaryOrange,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // =============================
  // MENU ITEM
  // =============================

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 18),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: AppColors.border, width: 1),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF3E0),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: AppColors.primaryOrange, size: 20),
              ),
              const SizedBox(width: 14),
              Expanded(child: Text(title, style: AppTextStyles.bodyLarge)),
              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: AppColors.greyText,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // =============================
  // LOGOUT BUTTON
  // =============================

  Widget _buildLogoutButton(ProfileAndSettingController ctrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: ctrl.logout,
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: const Color(0xFFFFF3E0),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.logout,
                color: AppColors.primaryOrange,
                size: 20,
              ),
            ),
            const SizedBox(width: 14),
            Text(
              'Log Out',
              style: AppTextStyles.bodyLarge.copyWith(
                color: AppColors.primaryOrange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
