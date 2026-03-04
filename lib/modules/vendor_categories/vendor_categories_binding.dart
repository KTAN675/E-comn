import 'package:get/get.dart';
import 'vendor_categories_controller.dart';

class VendorCategoriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VendorCategoriesController>(
          () => VendorCategoriesController(),
    );
  }
}