import 'package:get/get.dart';
import 'wishlist_controller.dart';

class WishlistBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<WishlistController>()) {
      Get.put<WishlistController>(WishlistController(), permanent: true);
    }
  }
}