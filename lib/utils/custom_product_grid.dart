import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant/app_colors.dart';
import '../data/models/product/product_model.dart';
import '../modules/products/widgets/product_card_mini.dart';
import '../modules/theme/theme_controller.dart';

class ProductsGrid extends StatelessWidget {
  final List<ProductModel> products;

  const ProductsGrid({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (theme) {
        final Color accent = AppColors.accent;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 100),
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 0.59,
          ),
          itemBuilder: (context, index) {
            return ProductCardMini(
              product: products[index],
              accent: accent,
              discountColor: accent,
              cardBackground: Colors.white,
            );
          },
        );
      },
    );
  }
}