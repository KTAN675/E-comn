import 'package:flutter/material.dart';
import '../../../constant/app_text_styles.dart';
import '../orders_detail_controller.dart';

class OrderInfoCard extends StatelessWidget {

  final OrderDetailController controller;

  const OrderInfoCard({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: const Color(0xffF6F6F6),
        borderRadius: BorderRadius.circular(22),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            "Order Details",
            style: AppTextStyles.h3,
          ),

          const SizedBox(height: 18),

          _row("Order ID", controller.orderId),
          _row("Receiver Details", controller.receiver),
          _row("Vendor Details", controller.vendor),
          _row("Delivery Address", controller.address),
          _row("Order Placed at", controller.date),
        ],
      ),
    );
  }

  Widget _row(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            title,
            style: AppTextStyles.caption,
          ),

          const SizedBox(height: 3),

          Text(
            value,
            style: AppTextStyles.bodyLarge,
          ),
        ],
      ),
    );
  }
}