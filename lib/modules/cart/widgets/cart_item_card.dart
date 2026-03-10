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

  /// Formats double to clean price string
  /// 150.0 → "150"  |  150.5 → "150.5"
  String _formatPrice(double price) {
    return price == price.truncateToDouble()
        ? price.toInt().toString()
        : price.toStringAsFixed(1);
  }

  @override
  Widget build(BuildContext context) {
    final int discountPercent = item.originalPrice > 0
        ? (((item.originalPrice - item.price) / item.originalPrice) * 100)
        .round()
        : 0;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// IMAGE BOX
          Stack(
            children: [
              Container(
                height: 85,
                width: 85,
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

              /// DISCOUNT BADGE
              if (discountPercent > 0)
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(14),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                    child: Text(
                      "$discountPercent%",
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),

          const SizedBox(width: 14),

          /// TEXT + ACTIONS
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// TITLE + STEPPER ROW
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    /// NAME + SUBTITLE
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name,
                            style: AppTextStyles.bodyLarge,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item.subtitle,
                            style: AppTextStyles.bodyGrey,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 10),

                    /// STEPPER
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.border),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: onDecrease,
                            child: const Padding(
                              padding: EdgeInsets.all(6),
                              child: Icon(Icons.remove, size: 16),
                            ),
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 6),
                            child: Text(
                              "${item.quantity}",
                              style: AppTextStyles.bodyLarge,
                            ),
                          ),
                          GestureDetector(
                            onTap: onIncrease,
                            child: Padding(
                              padding: const EdgeInsets.all(6),
                              child: Icon(
                                Icons.add,
                                size: 16,
                                color: AppColors.accent,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                /// WISHLIST + PRICE ROW
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    /// MOVE TO WISHLIST
                    GestureDetector(
                      onTap: onWishlist,
                      child: Text(
                        "Move to Wishlist",
                        style: AppTextStyles.caption.copyWith(
                          decoration: TextDecoration.underline,
                          decorationStyle: TextDecorationStyle.dotted,
                        ),
                      ),
                    ),

                    const Spacer(),

                    /// PRICES
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // Original price (strikethrough)
                        if (item.originalPrice > item.price)
                          Text(
                            "₹${_formatPrice(item.originalPrice)}",
                            style: AppTextStyles.strikePrice,
                          ),

                        // Final price
                        Text(
                          "₹${_formatPrice(item.price)}",
                          style: AppTextStyles.price.copyWith(
                            color: Colors.green,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
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
