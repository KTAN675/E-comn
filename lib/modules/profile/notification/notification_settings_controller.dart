import 'package:get/get.dart';

class NotificationSettingsController extends GetxController {
  /// Enable All
  bool enableAll = false;

  /// Promos
  bool promosPush = false;
  bool promosEmail = false;
  bool promosWhatsapp = false;

  /// Orders
  bool ordersPush = false;
  bool ordersEmail = false;
  bool ordersWhatsapp = false;

  /// Updates
  bool updatesEmail = false;

  // =============================
  // Toggle Individual Notification
  // =============================
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

    _updateEnableAllState();
    update();
  }

  // =============================
  // Toggle Enable All
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

  // =============================
  // Auto Update Enable All State
  // =============================
  void _updateEnableAllState() {
    enableAll =
        promosPush &&
        promosEmail &&
        promosWhatsapp &&
        ordersPush &&
        ordersEmail &&
        ordersWhatsapp &&
        updatesEmail;
  }

  // =============================
  // Save Changes
  // =============================
  void saveNotificationChanges() {
    // Yaha API call ya local storage save kar sakte ho

    Get.snackbar(
      "Success",
      "Notification settings saved successfully",
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
