import 'package:get/get.dart';
import '../../../data/models/product/product_model.dart';
import 'product_detail_controller.dart';

class ProductDetailBinding extends Bindings {
  @override
  void dependencies() {

    final product = Get.arguments;

    if (product is ProductModel) {
      Get.lazyPut<ProductDetailController>(
            () => ProductDetailController()..product = product,
      );
    } else {
      throw Exception("ProductDetailBinding requires ProductModel argument");
    }

  }
}