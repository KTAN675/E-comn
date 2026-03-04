import 'package:get/get.dart';
import 'product_listing_controller.dart';

class ProductListingBinding extends Bindings {
  @override
  void dependencies() {
    final args = Get.arguments as Map?;
    final isGrocery = args?["isGrocery"] ?? true;

    Get.lazyPut(
          () => ProductListingController(isGrocery: isGrocery),
    );
  }
}