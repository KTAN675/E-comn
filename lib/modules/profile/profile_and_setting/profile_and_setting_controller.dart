import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/app_colors.dart';
import '../../../constant/app_text_styles.dart';
import '../../theme/theme_controller.dart';

class ProfileAndSettingController extends GetxController {

  // =============================
  // PROFILE IMAGE
  // =============================

  File? profileImage;

  void setProfileImage(File image) {
    profileImage = image;
    update();
  }

  // =============================
  // PROFILE FIELDS
  // =============================

  final nameController = TextEditingController(text: 'Ghana Sawant');
  final phoneController = TextEditingController(text: '+91 9898989811');
  final emailController = TextEditingController(text: 'ghanasawant70@gmail.com');
  final dobController = TextEditingController(text: '17/07/1999');
  final flatController = TextEditingController(text: '08/Rustomjee');
  final floorController = TextEditingController(text: '10th floor');
  final areaController = TextEditingController(text: 'Mumbai, Bandra');

  // =============================
  // NOTIFICATION TOGGLES
  // =============================

  bool enableAll = true;

  bool promosPush = true;
  bool promosEmail = false;
  bool promosWhatsapp = false;

  bool ordersPush = true;
  bool ordersEmail = false;
  bool ordersWhatsapp = true;

  bool updatesEmail = false;

  // =============================
  // WALLET & REWARDS
  // =============================

  String walletBalance = '₹1000';
  String rewardsCount = '2 new';

  // =============================
  // PROFILE UPDATE
  // =============================

  void updateProfile() {
    update();
    Get.back();

    Get.snackbar(
      'Profile Updated',
      'Your profile has been updated successfully.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
    );
  }

  // =============================
  // NOTIFICATION METHODS
  // =============================

  void toggleEnableAll(bool value) {
    enableAll = value;
    promosPush = value;
    promosEmail = value;
    promosWhatsapp = value;
    ordersPush = value;
    ordersEmail = value;
    ordersWhatsapp = value;
    updatesEmail = value;
    update();
  }

  void toggleNotification(String key, bool value) {
    switch (key) {
      case 'promosPush': promosPush = value; break;
      case 'promosEmail': promosEmail = value; break;
      case 'promosWhatsapp': promosWhatsapp = value; break;
      case 'ordersPush': ordersPush = value; break;
      case 'ordersEmail': ordersEmail = value; break;
      case 'ordersWhatsapp': ordersWhatsapp = value; break;
      case 'updatesEmail': updatesEmail = value; break;
    }
    _checkEnableAll();
    update();
  }

  void _checkEnableAll() {
    enableAll = promosPush &&
        promosEmail &&
        promosWhatsapp &&
        ordersPush &&
        ordersEmail &&
        ordersWhatsapp &&
        updatesEmail;
  }

  void saveNotificationChanges() {
    Get.snackbar(
      'Settings Saved',
      'Notification preferences updated.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
    );
  }

  void logout() {

    // ✅ Get accent dynamically from ThemeController
    final Color accent = Get.find<ThemeController>().currentAccent;

    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              /// ICON
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppColors.lightAccent, // ✅ Dynamic static (updates via setTheme)
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.logout,
                  color: accent, // ✅ Dynamic
                  size: 26,
                ),
              ),

              const SizedBox(height: 16),

              /// TITLE
              Text(
                "Log out?",
                style: AppTextStyles.h2,
              ),

              const SizedBox(height: 8),

              /// MESSAGE
              Text(
                "Are you sure you want to log out of your account?",
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyGrey,
              ),

              const SizedBox(height: 22),

              /// BUTTONS
              Row(
                children: [

                  /// CANCEL
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Get.back(),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        "Cancel",
                        style: AppTextStyles.buttonSecondary,
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  /// LOGOUT
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                        Get.offAllNamed('/login');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: accent, // ✅ Dynamic
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        "Log out",
                        style: AppTextStyles.button,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onClose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    dobController.dispose();
    flatController.dispose();
    floorController.dispose();
    areaController.dispose();
    super.onClose();
  }
}