import 'package:get/get.dart';
import '../../data/models/product/product_model.dart';

class WishlistController extends GetxController {

  // ✅ Wishlist items list
  final List<ProductModel> _wishlistItems = [];

  List<ProductModel> get wishlistProducts => _wishlistItems;

  int get wishlistCount => _wishlistItems.length;

  // ✅ Toggle wishlist (using id for reliable comparison)
  void toggleWishlist(ProductModel product) {
    final exists = _wishlistItems.any((p) => p.id == product.id);
    if (exists) {
      _wishlistItems.removeWhere((p) => p.id == product.id);
    } else {
      _wishlistItems.add(product);
    }
    update();
  }

  // ✅ Check if product is in wishlist
  bool isWishlisted(ProductModel product) {
    return _wishlistItems.any((p) => p.id == product.id);
  }
}