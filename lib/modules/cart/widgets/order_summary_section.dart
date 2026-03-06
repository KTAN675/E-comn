import 'package:e_comm/utils/app_section_divider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant/app_colors.dart';
import '../../../constant/app_text_styles.dart';
import '../cart_controller.dart';

class OrderSummarySection extends GetView<CartController> {
  const OrderSummarySection({super.key});

  Widget _row(String title, String value, {bool bold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Text(
            title,
            style: bold
                ? AppTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w600)
                : AppTextStyles.bodyGrey,
          ),
          const Spacer(),
          Text(
            value,
            style: bold
                ? AppTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w700)
                : AppTextStyles.bodyGrey,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (controller) {

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(26),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// TITLE
              Text(
                "Delivery Address",
                style: AppTextStyles.bodyLarge.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 16),

              /// ORDER AMOUNT
              _row(
                "Order Amount",
                "₹${controller.orderAmount.toStringAsFixed(2)}",
              ),

              /// PROMO
             /* _row(
                "Promo-code",
                "₹${controller.promo.toStringAsFixed(2)}",
              ),

              /// DELIVERY
              _row(
                "Delivery",
                "₹${controller.delivery.toStringAsFixed(2)}",
              ),*/

              /// TAX
              _row(
                "Tax",
                "₹${controller.tax.toStringAsFixed(2)}",
              ),

              const SizedBox(height: 10),

              AppSectionDivider(),

              const SizedBox(height: 10),

              /// TOTAL
              _row(
                "Total Amount",
                "₹${controller.totalAmount.toStringAsFixed(2)}",
                bold: true,
              ),
            ],
          ),
        );
      },
    );
  }
}