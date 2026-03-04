import 'package:flutter/material.dart';
import '../../../constant/app_text_styles.dart';
import '../orders_detail_controller.dart';
import 'bill_row.dart';

class BillDetailsSection extends StatelessWidget {

  final OrderDetailController controller;

  const BillDetailsSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          "BILL DETAILS",
          style: AppTextStyles.h3,
        ),

        const SizedBox(height: 20),

        ...controller.items.map((e) =>
            BillRow(title: e.name, price: e.price)
        ),

        const SizedBox(height: 10),

        const Divider(),

        BillRow(title: "Item Total", price: controller.itemTotal),
        BillRow(title: "Platform Fee", price: controller.platformFee),
        BillRow(title: "Delivery Fee", price: controller.deliveryFee),
        BillRow(title: "Taxes", price: controller.tax),

        const Divider(),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Text(
              "Paid Via Bank",
              style: AppTextStyles.bodyLarge,
            ),

            Text(
              "Total  ₹${controller.total}",
              style: AppTextStyles.bodyLarge.copyWith(
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        )
      ],
    );
  }
}