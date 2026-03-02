import 'package:get/get.dart';
import '../dashboard/dashboard_controller.dart';
import '../../data/models/product/product_model.dart';

class WishlistController extends GetxController {

  final DashboardController dashboardController =
  Get.find<DashboardController>();

  /// For now reuse today's specials as wishlist items
  List<ProductModel> get wishlistProducts =>
      dashboardController.todaysSpecials;
}