import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/app_colors.dart';
import '../../constant/app_text_styles.dart';
import '../../utils/app_primary_button.dart';
import 'orders_detail_controller.dart';
import 'widgets/order_info_card.dart';
import 'widgets/bill_details_section.dart';

class OrderDetailView extends GetView<OrderDetailController> {
  const OrderDetailView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.white,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),

        title: Column(
          children: [

            Text(
              "Order #${controller.orderId}",
              style: AppTextStyles.h3,
            ),

            const SizedBox(height: 2),

            Text(
              "${controller.status}, ${controller.itemCount} items, ₹${controller.amount}",
              style: AppTextStyles.caption,
            )
          ],
        ),

        centerTitle: true,

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                "Help",
                style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.primaryOrange,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [

            const SizedBox(height: 20),

            /// ORDER INFO
            OrderInfoCard(controller: controller),

            const SizedBox(height: 24),

            /// BILL DETAILS
            BillDetailsSection(controller: controller),

            const SizedBox(height: 30),

            /// ORDER AGAIN
            AppPrimaryButton(
              title: "Order Again",
              onTap: controller.reorder,
            ),

            const SizedBox(height: 14),

            /// ADD REVIEW
            AppPrimaryButton(
              title: "Add review",
              onTap: controller.addReview,
            ),

            const SizedBox(height: 40)
          ],
        ),
      ),
    );
  }
}