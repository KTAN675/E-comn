import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant/app_text_styles.dart';
import '../../../data/models/product/product_model.dart';
import '../../wishlist/wishlist_controller.dart';

class ProductCardMini extends StatelessWidget {
  final ProductModel product;
  final Color accent;
  final Color discountColor;
  final Color cardBackground;

  final VoidCallback? onAdd;

  const ProductCardMini({
    super.key,
    required this.product,
    required this.accent,
    required this.discountColor,
    this.cardBackground = Colors.white,
    this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WishlistController>(
      builder: (wishlist) {

        final bool isFavorite = wishlist.isWishlisted(product); // ✅

        return Container(
          decoration: BoxDecoration(
            color: cardBackground,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 14,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// IMAGE + BADGES
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Image.asset(
                        product.image,
                        height: 110,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),

                    /// ❤️ FAVORITE
                    Positioned(
                      top: 6,
                      left: 6,
                      child: GestureDetector(
                        onTap: () => wishlist.toggleWishlist(product), // ✅
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: accent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border, // ✅
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ),

                    /// DISCOUNT
                    if (product.discount != null)
                      Positioned(
                        top: 6,
                        right: 6,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: discountColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            "${product.discount}%",
                            style: AppTextStyles.caption.copyWith(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),

                const SizedBox(height: 10),

                /// TITLE
                Text(
                  product.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.bodyLarge.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 4),

                /// WEIGHT
                Text(
                  product.weight,
                  style: AppTextStyles.bodyGrey.copyWith(fontSize: 12),
                ),

                const SizedBox(height: 8),

                /// PRICE ROW
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [

                    /// PRICE AREA
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "₹${product.price.toStringAsFixed(2)}",
                            style: AppTextStyles.price.copyWith(fontSize: 14),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          if (product.oldPrice != null)
                            Text(
                              "₹${product.oldPrice!.toStringAsFixed(2)}",
                              style: AppTextStyles.strikePrice.copyWith(fontSize: 11),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 6),

                    /// ADD BUTTON
                    GestureDetector(
                      onTap: onAdd,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: accent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}