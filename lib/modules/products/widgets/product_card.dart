  import 'package:flutter/material.dart';
  import '../../../constant/app_text_styles.dart';
  import '../../../data/models/product/product_model.dart';

  class ProductCard extends StatelessWidget {
    final ProductModel product;

    /// THEME COLORS (Injected)
    final Color accent;
    final Color discountColor;
    final Color cardBackground;

    final VoidCallback? onAdd;
    final VoidCallback? onFavorite;

    const ProductCard({
      super.key,
      required this.product,
      required this.accent,
      required this.discountColor,
      this.cardBackground = const Color(0xFFEFEFEF),
      this.onAdd,
      this.onFavorite,
    });

    @override
    Widget build(BuildContext context) {
      return Container(
        width: 190,
        decoration: BoxDecoration(
          color: cardBackground,
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 16,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// 🔹 Image + Badges
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(22),
                    child: Image.asset(
                      product.image,
                      height: 130,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  /// 🔸 Favorite Icon
                  Positioned(
                    top: 8,
                    left: 8,
                    child: GestureDetector(
                      onTap: onFavorite,
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: accent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),

                  /// 🔸 Discount Badge
                  if (product.discount != null)
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: discountColor,
                          borderRadius: BorderRadius.circular(10),
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

              const SizedBox(height: 14),

              /// 🔹 Title
              Text(
                product.title,
                style: AppTextStyles.bodyLarge.copyWith(
                  fontWeight: FontWeight.w700,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(height: 4),

              /// 🔹 Weight
              Text(
                product.weight,
                style: AppTextStyles.bodyGrey,
              ),

              const SizedBox(height: 10),

              /// 🔹 Price Row
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [

                  /// PRICE AREA
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          "\$${product.price.toStringAsFixed(2)}",
                          style: AppTextStyles.price,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),

                        if (product.oldPrice != null)
                          Text(
                            "\$${product.oldPrice!.toStringAsFixed(2)}",
                            style: AppTextStyles.strikePrice,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 8),

                  /// ADD BUTTON
                  SizedBox(
                    width: 36,
                    height: 36,
                    child: GestureDetector(
                      onTap: onAdd,
                      child: Container(
                        decoration: BoxDecoration(
                          color: accent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20,
                        ),
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