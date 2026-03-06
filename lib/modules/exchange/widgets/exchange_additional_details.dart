import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant/app_text_styles.dart';
import '../exchange_controller.dart';

class ExchangeAdditionalDetails extends StatelessWidget {
  const ExchangeAdditionalDetails({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.find<ExchangeController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          "Additional Details",
          style: AppTextStyles.bodyLarge,
        ),

        const SizedBox(height: 10),

        TextField(
          maxLines: 4,
          decoration: InputDecoration(
            hintText: "Describe the issue",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onChanged: (value) {
            controller.additionalDetails = value;
          },
        ),
      ],
    );
  }
}