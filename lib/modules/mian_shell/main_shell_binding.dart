import 'package:realtime_user/modules/cart/cart_controller.dart';
import 'package:realtime_user/modules/orders/orders_controller.dart';
import 'package:get/get.dart';
import '../dashboard/dashboard_controller.dart';
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
    Get.lazyPut<CartController>(() => CartController());
    Get.lazyPut<OrdersController>(() => OrdersController());
    Get.put<WishlistController>(WishlistController(), permanent: true);
  }
}