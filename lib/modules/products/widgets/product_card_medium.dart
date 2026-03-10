import 'package:realtime_user/constant/app_colors.dart';
import 'package:flutter/material.dart';
import '../../../constant/app_text_styles.dart';
import '../../../data/models/product/product_model.dart';

class ProductCardMedium extends StatelessWidget {
  final ProductModel product;

  final Color accent;
  final Color discountColor;
  final Color cardBackground;

  final VoidCallback? onAdd;

  const ProductCardMedium({
    super.key,
    required this.product,
    required this.accent,
     this.discountColor = const Color(0xFF810700),
    this.cardBackground = const Color(0xFFF4F4F4),
    this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cardBackground,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 12,
            offset: const Offset(0, 6),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// IMAGE
            Stack(
              children: [

                ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Image.asset(
                    product.image,
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                /// DISCOUNT BADGE
                if (product.discount != null)
                  Positioned(
                    right: 8,
                    top: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: discountColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "${product.discount}%",
                        style: AppTextStyles.caption.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
              ],
            ),

            const SizedBox(height: 12),

            /// TITLE
            Text(
              product.title,
              style: AppTextStyles.bodyLarge.copyWith(
                fontWeight: FontWeight.w700,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),

            const SizedBox(height: 4),

            /// SUBTITLE
            if (product.subtitle != null)
              Text(
                product.subtitle!,
                style: AppTextStyles.bodyGrey,
              ),

            const SizedBox(height: 4),

            /// WEIGHT
            Text(
              product.weight,
              style: AppTextStyles.bodyGrey,
            ),

            const SizedBox(height: 10),

            /// PRICE + ADD BUTTON
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [

                /// PRICE COLUMN
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        "₹${product.price.toStringAsFixed(2)}",
                        style: AppTextStyles.price,
                      ),

                      if (product.oldPrice != null)
                        Text(
                          "₹${product.oldPrice!.toStringAsFixed(2)}",
                          style: AppTextStyles.strikePrice,
                        ),
                    ],
                  ),
                ),

                /// ADD BUTTON
                GestureDetector(
                  onTap: onAdd,
                  child: Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      color: AppColors.primaryOrange,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}