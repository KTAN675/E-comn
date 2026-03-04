import 'package:flutter/material.dart';
import '../../../constant/app_colors.dart';
import '../../../constant/app_text_styles.dart';
import '../../../data/models/cart/cart_item_model.dart';


class CartItemCard extends StatelessWidget {
  final CartItemModel item;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final VoidCallback onWishlist;

  const CartItemCard({
    super.key,
    required this.item,
    required this.onIncrease,
    required this.onDecrease,
    required this.onWishlist,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Stack(
        children: [

          /// MAIN CONTENT
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// IMAGE BOX
              Container(
                height: 80,
                width: 80,
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Image.asset(
                  item.image,
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(width: 14),

              /// TEXT SECTION
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    /// TITLE
                    Text(
                      item.name,
                      style: AppTextStyles.bodyLarge,
                    ),

                    const SizedBox(height: 6),

                    Text(
                      item.subtitle,
                      style: AppTextStyles.bodyGrey,
                    ),

                    const SizedBox(height: 14),

                    Row(
                      children: [

                        /// MOVE TO WISHLIST
                        GestureDetector(
                          onTap: onWishlist,
                          child: Text(
                            "Move to Wishlist",
                            style: AppTextStyles.caption.copyWith(
                              decoration: TextDecoration.underline,
                              decorationStyle:
                              TextDecorationStyle.dotted,
                            ),
                          ),
                        ),

                        const Spacer(),

                        Text(
                          "₹${item.originalPrice}",
                          style: AppTextStyles.strikePrice,
                        ),

                        const SizedBox(width: 6),

                        Text(
                          "₹${item.price}",
                          style: AppTextStyles.price.copyWith(
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          /// STEPPER (FLOATING)
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: onDecrease,
                      child: const Padding(
                        padding: EdgeInsets.all(8),
                        child: Icon(Icons.remove, size: 18),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        "${item.quantity}",
                        style: AppTextStyles.bodyLarge,
                      ),
                    ),

                    GestureDetector(
                      onTap: onIncrease,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Icon(
                          Icons.add,
                          size: 18,
                          color: AppColors.accent,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )        ],
      ),
    );
  }
}