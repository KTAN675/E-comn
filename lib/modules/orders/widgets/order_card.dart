import 'package:realtime_user/utils/app_section_divider.dart';
import 'package:flutter/material.dart';
import '../../../constant/app_colors.dart';
import '../../../constant/app_text_styles.dart';
import '../../../data/models/order/order_model.dart';

class OrderCard extends StatelessWidget {
  final OrderModel order;
  final VoidCallback? onTap;
  final VoidCallback? onReorder;

  const OrderCard({
    super.key,
    required this.order,
    this.onTap,
    this.onReorder,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xffF6F6F6),
          borderRadius: BorderRadius.circular(24),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// TOP ROW
            Row(
              children: [

                Text(
                  order.status,
                  style: AppTextStyles.bodyLarge.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const Spacer(),

                Text(
                  "₹${order.amount.toStringAsFixed(0)}",
                  style: AppTextStyles.bodyLarge.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(width: 6),

                const Icon(Icons.chevron_right)
              ],
            ),

            const SizedBox(height: 6),

            /// DATE
            Text(
              order.date,
              style: AppTextStyles.bodyGrey,
            ),

            const SizedBox(height: 14),

            /// PRODUCT IMAGES
            Row(
              children: order.images
                  .take(3)
                  .map(
                    (img) => Container(
                  margin: const EdgeInsets.only(right: 10),
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      img,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
                  .toList(),
            ),

            const SizedBox(height: 14),

            /// DIVIDER
            AppSectionDivider(),

            const SizedBox(height: 8),

            /// ORDER AGAIN
            Center(
              child: GestureDetector(
                onTap: onReorder,
                child: Text(
                  "Order Again",
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: AppColors.primaryOrange,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}