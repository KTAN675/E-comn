import 'package:realtime_user/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constant/app_text_styles.dart';
import '../../../../data/models/product/product_model.dart';
import '../../widgets/product_card_medium.dart';
import '../../../theme/theme_controller.dart';

class YouMayAlsoLikeSection extends StatelessWidget {
  final List<ProductModel> products;

  const YouMayAlsoLikeSection({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {

    return GetBuilder<ThemeController>(
      builder: (theme) {
        final Color accent = AppColors.accent;

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
                    style: AppTextStyles.accent(accent),
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
                    accent: accent,
                    discountColor: Colors.red,
                    onAdd: () {},
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}