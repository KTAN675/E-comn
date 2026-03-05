import '../product/product_model.dart';

class CartItemModel {
  final String id;
  final String name;
  final String subtitle;
  final String image;
  final double price;
  final double originalPrice;

  int quantity;

  CartItemModel({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.image,
    required this.price,
    required this.originalPrice,
    this.quantity = 1,
  });

  double get total => price * quantity;

  /// ⭐ Convert Product → CartItem
  factory CartItemModel.fromProduct(ProductModel product) {
    return CartItemModel(
      id: product.title, // temporary id
      name: product.title,
      subtitle: product.weight,
      image: product.image,
      price: product.price,
      originalPrice: product.oldPrice ?? product.price,
    );
  }
}