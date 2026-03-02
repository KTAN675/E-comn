import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileAndSettingController extends GetxController {
  // =============================
  // PROFILE FIELDS
  // =============================

  final nameController = TextEditingController(text: 'Ghana Sawant');
  final phoneController = TextEditingController(text: '+91 9898989811');
  final emailController = TextEditingController(
    text: 'ghanasawant70@gmail.com',
  );
  final dobController = TextEditingController(text: '17/07/1999');
  final flatController = TextEditingController(text: '08/Rustomjee');
  final floorController = TextEditingController(text: '10th floor');
  final areaController = TextEditingController(text: 'Mumbai, Bandra');

  // =============================
  // NOTIFICATION TOGGLES
  // =============================

  bool enableAll = true;

  // Promos and offers
  bool promosPush = true;
  bool promosEmail = false;
  bool promosWhatsapp = false;

  // Orders and Purchases
  bool ordersPush = true;
  bool ordersEmail = false;
  bool ordersWhatsapp = true;

  // Important Updates
  bool updatesEmail = false;

  // =============================
  // WALLET & REWARDS (static demo)
  // =============================

  String walletBalance = '₹1000';
  String rewardsCount = '2 new';

  // =============================
  // METHODS
  // =============================

  void toggleEnableAll(bool value) {
    enableAll = value;
    if (value) {
      promosPush = true;
      promosEmail = true;
      promosWhatsapp = true;
      ordersPush = true;
      ordersEmail = true;
      ordersWhatsapp = true;
      updatesEmail = true;
    } else {
      promosPush = false;
      promosEmail = false;
      promosWhatsapp = false;
      ordersPush = false;
      ordersEmail = false;
      ordersWhatsapp = false;
      updatesEmail = false;
    }
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
    enableAll =
        promosPush &&
        promosEmail &&
        promosWhatsapp &&
        ordersPush &&
        ordersEmail &&
        ordersWhatsapp &&
        updatesEmail;
  }

  void updateProfile() {
    Get.snackbar(
      'Profile Updated',
      'Your profile has been updated successfully.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
    );
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
          TextButton(onPressed: () => Get.back(), child: const Text('Cancel')),
          TextButton(
            onPressed: () {
              Get.back();
              Get.offAllNamed('/login');
            },
            child: const Text('Log Out', style: TextStyle(color: Colors.red)),
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
