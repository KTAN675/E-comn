import 'package:flutter/material.dart';
import '../../../../constant/app_text_styles.dart';

class DeliveryServicesContent extends StatelessWidget {
  const DeliveryServicesContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          _InfoBlock(
            title: "Delivery",
            description:
            "Delivery available within selected service areas. Orders are usually delivered within the same day depending on slot availability.",
          ),

          SizedBox(height: 20),

          _InfoBlock(
            title: "Return & Replacement",
            description:
            "If the product is damaged or not fresh upon delivery, you may request a replacement or refund within 24 hours of delivery.",
          ),

          SizedBox(height: 20),

          _InfoBlock(
            title: "Customer Support",
            description:
            "For delivery issues or service related queries, please contact our customer support team via the help center or registered support number.",
          ),
        ],
      ),
    );
  }
}

class _InfoBlock extends StatelessWidget {
  final String title;
  final String description;

  const _InfoBlock({
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          title,
          style: AppTextStyles.h3,
        ),

        SizedBox(height: 6),

        Text(
          description,
          style: AppTextStyles.bodyGrey,
        ),
      ],
    );
  }
}