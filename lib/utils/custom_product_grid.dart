import 'package:flutter/material.dart';
import '../data/models/product/product_model.dart';
import '../modules/products/widgets/product_card.dart';

class ProductsGrid extends StatelessWidget {
  final List<ProductModel> products;

  /// THEME COLORS (Injected from parent/controller)
  final Color accent;
  final Color discountColor;
  final Color cardBackground;

  const ProductsGrid({
    super.key,
    required this.products,
    required this.accent,
    required this.discountColor,
    this.cardBackground = const Color(0xFFEFEFEF),
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: products.length,
      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.52,
      ),
      itemBuilder: (context, index) {
        return ProductCard(
          product: products[index],
          accent: accent,
          discountColor: discountColor,
          cardBackground: cardBackground,
        );
      },
    );
  }
}