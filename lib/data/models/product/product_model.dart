class ProductModel {
  final String title;
  final String image;
  final String weight;
  final double price;
  final double? oldPrice;
  final int? discount; // percentage
  final bool isFavorite;

  ProductModel({
    required this.title,
    required this.image,
    required this.weight,
    required this.price,
    this.oldPrice,
    this.discount,
    this.isFavorite = false,
  });
}