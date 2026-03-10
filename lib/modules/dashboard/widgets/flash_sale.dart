import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constant/app_colors.dart';
import '../../../constant/app_text_styles.dart';
import '../../../data/models/product/product_model.dart';
import '../../products/widgets/product_card.dart';

class FlashSaleSection extends StatelessWidget {
  final List<ProductModel> products;

  final Color? backgroundColor;
  final Color? headerTextColor;

  final VoidCallback? onSeeAll;

  const FlashSaleSection({
    super.key,
    required this.products,
    this.backgroundColor,
    this.headerTextColor,
    this.onSeeAll,
  });

  @override
  Widget build(BuildContext context) {
    final accent = AppColors.accent;

    return Container(
      color: backgroundColor ?? Colors.transparent,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [

          /// 🔹 Header
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: const [],
          //   ),
          // ),

        //  const SizedBox(height: 18),

          /// 🔹 Product Grid (2 × 2)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [

                /// Row 1
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (products.isNotEmpty)
                      SizedBox(
                        width: 155,
                        child: ProductCard(
                          product: products[0],
                          accent: accent,
                          discountColor: accent,
                          showShadow: false,
                        ),
                      ),

                    if (products.length > 1)
                      SizedBox(
                        width: 155,
                        child: ProductCard(
                          product: products[1],
                          accent: accent,
                          discountColor: accent,
                          showShadow: false,
                        ),
                      ),
                  ],
                ),

                const SizedBox(height: 20),

                /// Row 2
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (products.length > 2)
                      SizedBox(
                        width: 155,
                        child: ProductCard(
                          product: products[2],
                          accent: accent,
                          discountColor: accent,
                          showShadow: false,
                        ),
                      ),

                    if (products.length > 3)
                      SizedBox(
                        width: 155,
                        child: ProductCard(
                          product: products[3],
                          accent: accent,
                          discountColor: accent,
                          showShadow: false,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}