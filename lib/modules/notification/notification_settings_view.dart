import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/app_colors.dart';
import '../../constant/app_text_styles.dart';
import '../../utils/app_primary_button.dart';
import '../profile_and_setting/profile_and_setting_controller.dart';

class NotificationSettingsView extends GetView<ProfileAndSettingController> {
  const NotificationSettingsView({super.key});

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
        title: Text('Notification', style: AppTextStyles.h2),
      ),
      body: GetBuilder<ProfileAndSettingController>(
        builder: (ctrl) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// 🔹 Enable All Toggle
                      _buildEnableAllToggle(ctrl),

                      const Divider(height: 1, color: AppColors.border),

                      /// 🔹 Promos and offers
                      _buildSectionHeader(
                        'Promos and offers',
                        'Receive updates about coupons, promotions and offers',
                      ),
                      _buildToggleItem(
                        icon: Icons.notifications,
                        title: 'Push Notifications',
                        value: ctrl.promosPush,
                        onChanged: (v) =>
                            ctrl.toggleNotification('promosPush', v),
                      ),
                      _buildToggleItem(
                        icon: Icons.mail_outline,
                        title: 'Email',
                        value: ctrl.promosEmail,
                        onChanged: (v) =>
                            ctrl.toggleNotification('promosEmail', v),
                      ),
                      _buildToggleItem(
                        icon: Icons.chat_bubble_outline,
                        title: 'Whatsapp',
                        value: ctrl.promosWhatsapp,
                        onChanged: (v) =>
                            ctrl.toggleNotification('promosWhatsapp', v),
                      ),

                      const SizedBox(height: 8),
                      const Divider(height: 1, color: AppColors.border),

                      /// 🔹 Orders and Purchases
                      _buildSectionHeader(
                        'Orders and Purchases',
                        'Receive updates about coupons, promotions and offers',
                      ),
                      _buildToggleItem(
                        icon: Icons.notifications,
                        title: 'Push Notifications',
                        value: ctrl.ordersPush,
                        onChanged: (v) =>
                            ctrl.toggleNotification('ordersPush', v),
                      ),
                      _buildToggleItem(
                        icon: Icons.mail_outline,
                        title: 'Email',
                        value: ctrl.ordersEmail,
                        onChanged: (v) =>
                            ctrl.toggleNotification('ordersEmail', v),
                      ),
                      _buildToggleItem(
                        icon: Icons.chat_bubble_outline,
                        title: 'Whatsapp',
                        value: ctrl.ordersWhatsapp,
                        onChanged: (v) =>
                            ctrl.toggleNotification('ordersWhatsapp', v),
                      ),

                      const SizedBox(height: 8),
                      const Divider(height: 1, color: AppColors.border),

                      /// 🔹 Important Updates
                      _buildSectionHeader(
                        'Important Updates',
                        'Receive important updates related to your account',
                      ),
                      _buildToggleItem(
                        icon: Icons.mail_outline,
                        title: 'Email',
                        value: ctrl.updatesEmail,
                        onChanged: (v) =>
                            ctrl.toggleNotification('updatesEmail', v),
                      ),

                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),

              /// 🔹 Save Changes Button
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
                child: AppPrimaryButton(
                  title: 'Save Changes',
                  onTap: ctrl.saveNotificationChanges,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  // =============================
  // ENABLE ALL TOGGLE
  // =============================

  Widget _buildEnableAllToggle(ProfileAndSettingController ctrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enable all',
                style: AppTextStyles.bodyLarge.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 2),
              Text('Active all notification', style: AppTextStyles.caption),
            ],
          ),
          Switch(
            value: ctrl.enableAll,
            onChanged: ctrl.toggleEnableAll,
            activeThumbColor: AppColors.white,
            activeTrackColor: AppColors.primaryOrange,
            inactiveThumbColor: AppColors.white,
            inactiveTrackColor: Colors.grey[300],
          ),
        ],
      ),
    );
  }

  // =============================
  // SECTION HEADER
  // =============================

  Widget _buildSectionHeader(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.bodyLarge.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 2),
          Text(subtitle, style: AppTextStyles.caption),
        ],
      ),
    );
  }

  // =============================
  // TOGGLE ITEM
  // =============================

  Widget _buildToggleItem({
    required IconData icon,
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primaryOrange, size: 22),
          const SizedBox(width: 14),
          Expanded(child: Text(title, style: AppTextStyles.body)),
          Switch(
            value: value,
            onChanged: onChanged,
            activeThumbColor: AppColors.white,
            activeTrackColor: AppColors.primaryOrange,
            inactiveThumbColor: AppColors.white,
            inactiveTrackColor: Colors.grey[300],
          ),
        ],
      ),
    );
  }
}
