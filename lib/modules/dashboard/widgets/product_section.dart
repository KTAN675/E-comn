import 'package:flutter/material.dart';
import '../../../constant/app_text_styles.dart';
import '../../../data/models/product/product_model.dart';
import '../../products/widgets/product_card.dart';

class ProductsSection extends StatelessWidget {
  final String title;
  final List<ProductModel> products;

  /// THEME COLORS (Injected from Controller)
  final Color accent;
  final Color? backgroundColor;
  final Color? headerTextColor;

  final VoidCallback? onSeeAll;

  const ProductsSection({
    super.key,
    required this.title,
    required this.products,
    required this.accent,
    this.backgroundColor,
    this.headerTextColor,
    this.onSeeAll,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor ?? Colors.transparent,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [

          /// 🔹 Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                /// Title
                Text(
                  title,
                  style: AppTextStyles.h2.copyWith(
                    fontWeight: FontWeight.w700,
                    color: headerTextColor,
                  ),
                ),

                /// See All
                GestureDetector(
                  onTap: onSeeAll,
                  child: Row(
                    children: [
                      Text(
                        "See all",
                        style: AppTextStyles.body.copyWith(
                          color: accent,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 12,
                        color: accent,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

          /// 🔹 Product List
          SizedBox(
            height: 300,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              separatorBuilder: (_, __) =>
              const SizedBox(width: 20),
              itemBuilder: (context, index) {
                return ProductCard(
                  product: products[index],
                  accent: accent, discountColor: accent, // 🔥 Pass accent down
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}