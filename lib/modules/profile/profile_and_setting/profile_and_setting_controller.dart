import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileAndSettingController extends GetxController {

  // =============================
  // PROFILE IMAGE
  // =============================

  File? profileImage;

  void setProfileImage(File image) {
    profileImage = image;
    update(); // 🔥 UI refresh
  }

  // =============================
  // PROFILE FIELDS
  // =============================

  final nameController = TextEditingController(text: 'Ghana Sawant');
  final phoneController = TextEditingController(text: '+91 9898989811');
  final emailController =
  TextEditingController(text: 'ghanasawant70@gmail.com');
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
    update(); // 🔥 refresh ProfileWithSubscription

    Get.back(); // 🔥 go back to profile card

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
      case 'promosPush':
        promosPush = value;
        break;
      case 'promosEmail':
        promosEmail = value;
        break;
      case 'promosWhatsapp':
        promosWhatsapp = value;
        break;
      case 'ordersPush':
        ordersPush = value;
        break;
      case 'ordersEmail':
        ordersEmail = value;
        break;
      case 'ordersWhatsapp':
        ordersWhatsapp = value;
        break;
      case 'updatesEmail':
        updatesEmail = value;
        break;
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
    Get.dialog(
      AlertDialog(
        title: const Text('Log Out'),
        content: const Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
              onPressed: () => Get.back(), child: const Text('Cancel')),
          TextButton(
            onPressed: () {
              Get.back();
              Get.offAllNamed('/login');
            },
            child: const Text('Log Out',
                style: TextStyle(color: Colors.red)),
          ),
        ],
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