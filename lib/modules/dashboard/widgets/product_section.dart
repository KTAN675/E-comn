import 'package:flutter/material.dart';
import '../../../constant/app_colors.dart';
import '../../../constant/app_text_styles.dart';
import '../../../data/models/product/product_model.dart';
import '../../products/widgets/product_card.dart';

class ProductsSection extends StatelessWidget {
  final String title;
  final List<ProductModel> products;
  final VoidCallback? onSeeAll;
  final Color? backgroundColor;
  final Color? headerTextColor;
  final Color? seeAllColor;

  const ProductsSection({
    super.key,
    required this.title,
    required this.products,
    this.onSeeAll,
    this.backgroundColor,
    this.headerTextColor,
    this.seeAllColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor ?? Colors.transparent,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [

          /// Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: AppTextStyles.h2.copyWith(
                    fontWeight: FontWeight.w700,
                    color: headerTextColor ?? AppColors.black,
                  ),
                ),
                GestureDetector(
                  onTap: onSeeAll,
                  child: Row(
                    children: [
                      Text(
                        "See all",
                        style: AppTextStyles.body.copyWith(
                          color: seeAllColor ?? AppColors.accent,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 12,
                        color: seeAllColor ?? AppColors.accent,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

          /// Product List
          SizedBox(
            height: 300,
            child: ListView.separated(
              padding:
              const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              separatorBuilder: (_, __) =>
              const SizedBox(width: 20),
              itemBuilder: (context, index) {
                return ProductCard(
                  product: products[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}