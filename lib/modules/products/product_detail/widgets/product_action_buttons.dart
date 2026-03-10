import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constant/app_colors.dart';
import '../../../../constant/app_text_styles.dart';
import '../../../../utils/app_primary_button.dart';
import '../../../theme/theme_controller.dart';

class ProductActionButtons extends StatelessWidget {

  final VoidCallback onAddToCart;
  final VoidCallback onBuyNow;

  const ProductActionButtons({
    super.key,
    required this.onAddToCart,
    required this.onBuyNow,
  });

  @override
  Widget build(BuildContext context) {

    return GetBuilder<ThemeController>(
      builder: (theme) {
        final Color accent = AppColors.accent;

        return Container(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            children: [

              /// ADD TO CART
              Expanded(
                child: SizedBox(
                  height: 58,
                  child: OutlinedButton.icon(
                    onPressed: onAddToCart,
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      color: accent,
                    ),
                    label: Text(
                      "Add to Cart",
                      style: AppTextStyles.buttonSecondary.copyWith(
                        color: accent,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: accent,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 12),

              /// BUY NOW
              Expanded(
                child: AppPrimaryButton(
                  title: "Buy Now",
                  onTap: onBuyNow,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}