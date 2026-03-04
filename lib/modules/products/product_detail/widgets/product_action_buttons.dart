import 'package:flutter/material.dart';
import '../../../../constant/app_colors.dart';
import '../../../../constant/app_text_styles.dart';
import '../../../../utils/app_primary_button.dart';

class ProductActionButtons extends StatelessWidget {

  const ProductActionButtons({super.key});

  @override
  Widget build(BuildContext context) {

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
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  color: AppColors.primaryOrange,
                ),
                label: Text(
                  "Add to Cart",
                  style: AppTextStyles.buttonSecondary.copyWith(
                    color: AppColors.primaryOrange,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: AppColors.primaryOrange,
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
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}