import 'package:get/get.dart';
import '../dashboard/dashboard_controller.dart';
import '../notification/notification_controller.dart';
import '../wishlist/wishlist_controller.dart';
import '../category/category_controller.dart';
import 'main_shell_controller.dart';

class MainShellBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainShellController>(() => MainShellController());

    // Tab Controllers
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<CategoryController>(() => CategoryController());
    Get.lazyPut<NotificationController>(() => NotificationController());
    Get.lazyPut<WishlistController>(() => WishlistController());
  }
}