import 'package:flutter/material.dart';
import '../data/models/product/product_model.dart';
import '../modules/products/widgets/product_card.dart';

class ProductsGrid extends StatelessWidget {
  final List<ProductModel> products;

  /// THEME COLORS (Accent still dynamic)
  final Color accent;
  final Color discountColor;

  const ProductsGrid({
    super.key,
    required this.products,
    required this.accent,
    required this.discountColor,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(

      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 100),
      itemCount: products.length,
      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.58,
      ),
      itemBuilder: (context, index) {
        return ProductCard(
          product: products[index],
          accent: accent,
          discountColor: discountColor,
          cardBackground: Colors.white, // 🔥 ALWAYS WHITE
        );
      },
    );
  }
}