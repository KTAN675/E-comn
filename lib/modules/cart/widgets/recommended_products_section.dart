import 'package:flutter/material.dart';
import '../../../constant/app_colors.dart';
import '../../../constant/app_text_styles.dart';
import '../../../data/models/product/product_model.dart';
import '../../products/widgets/product_card_mini.dart';

class CartRecommendationsSection extends StatelessWidget {
  final List<ProductModel> products;
  final Function(ProductModel) onAdd;

  const CartRecommendationsSection({
    super.key,
    required this.products,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {

    final firstRow = products.take(3).toList();
    final secondRow = products.length > 6
        ? products.skip(3).take(3).toList()
        : [];

    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// TITLE
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Text(
              "You may also like",
              style: AppTextStyles.h2,
            ),
          ),

          const SizedBox(height: 16),

          /// FIRST ROW
          SizedBox(
            height: 250,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: firstRow.length,
              separatorBuilder: (_, __) => const SizedBox(width: 14),
              itemBuilder: (context, index) {

                final product = firstRow[index];

                return SizedBox(
                  width: 165,
                  child: ProductCardMini(
                    product: product,
                    accent: AppColors.accent,
                    discountColor: AppColors.primaryOrange,
                    onAdd: () => onAdd(product),
                  ),
                );
              },
            ),
          ),

          /// SECOND ROW ONLY IF >6 PRODUCTS
          if (products.length > 6) ...[
            const SizedBox(height: 18),

            SizedBox(
              height: 250,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: secondRow.length,
                separatorBuilder: (_, __) => const SizedBox(width: 14),
                itemBuilder: (context, index) {

                  final product = secondRow[index];

                  return SizedBox(
                    width: 165,
                    child: ProductCardMini(
                      product: product,
                      accent: AppColors.accent,
                      discountColor: AppColors.primaryOrange,
                      onAdd: () => onAdd(product),
                    ),
                  );
                },
              ),
            ),
          ]
        ],
      ),
    );
  }
}