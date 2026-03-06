import 'package:flutter/material.dart';
import '../../../constant/app_colors.dart';
import '../../../constant/app_text_styles.dart';

class TrackingProductCard extends StatelessWidget {
  const TrackingProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// PRODUCT IMAGE PLACEHOLDER
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.image_outlined,
              size: 32,
              color: Colors.grey,
            ),
          ),

          const SizedBox(width: 12),

          /// PRODUCT DETAILS
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  "Long Sleeve Overshirt, Khaki, 6",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.bodyLarge,
                ),

                const SizedBox(height: 4),

                Text(
                  "Delivering at : Pune, Maharashtra",
                  style: AppTextStyles.bodyGrey,
                ),

                Text(
                  "Arriving by : 22 Aug 2025",
                  style: AppTextStyles.bodyGrey,
                ),

                const SizedBox(height: 8),

                Row(
                  children: [

                    Text(
                      "₹366",
                      style: AppTextStyles.price,
                    ),

                    const SizedBox(width: 8),

                    Text(
                      "₹999",
                      style: AppTextStyles.strikePrice,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}