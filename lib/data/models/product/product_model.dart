class ProductModel {
  final String id; // ✅ Add karo
  final String title;
  final String? subtitle;
  final String image;
  final String weight;
  final double price;
  final double? oldPrice;
  final int? discount;
  final bool isFavorite;

  ProductModel({
    required this.id, // ✅ Add karo
    required this.title,
    this.subtitle,
    required this.image,
    required this.weight,
    required this.price,
    this.oldPrice,
    this.discount,
    this.isFavorite = false,
  });
}