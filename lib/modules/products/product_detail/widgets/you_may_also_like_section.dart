import 'package:e_comm/constant/app_colors.dart';
import 'package:flutter/material.dart';
import '../../../../constant/app_text_styles.dart';
import '../../../../data/models/product/product_model.dart';
import '../../widgets/product_card_medium.dart';

class YouMayAlsoLikeSection extends StatelessWidget {
  final List<ProductModel> products;

  const YouMayAlsoLikeSection({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// HEADER
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Text(
                "You may also like",
                style: AppTextStyles.h3,
              ),

              Text(
                "View All",
                style: AppTextStyles.accent(AppColors.primaryOrange),
              ),
            ],
          ),

          const SizedBox(height: 16),

          /// GRID
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 14,
              crossAxisSpacing: 12,
              childAspectRatio: .63,
            ),
            itemBuilder: (_, i) {

              final product = products[i];

              return ProductCardMedium(
                product: product,
                accent: Colors.orange,
                discountColor: Colors.red,
                onAdd: () {},
              );
            },
          ),
        ],
      ),
    );
  }
}