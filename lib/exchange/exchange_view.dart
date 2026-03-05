import 'package:e_comm/exchange/widgets/exchange_details_field.dart';
import 'package:e_comm/exchange/widgets/exchange_reason_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant/app_colors.dart';
import '../../../constant/app_text_styles.dart';
import 'exchange_controller.dart';

class ExchangeView extends GetView<ExchangeController> {
  const ExchangeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<ExchangeController>();
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: const Text("Request Exchange"),
        leading: const BackButton(),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// Exchange Reason Title
                Text(
                  "Exchange Reason",
                  style: AppTextStyles.bodyLarge,
                ),

                const SizedBox(height: 10),

                /// Reason Dropdown
                const ExchangeReasonDropdown(),

                const SizedBox(height: 24),

                /// Additional Details Title
                Text(
                  "Additional Details",
                  style: AppTextStyles.bodyLarge,
                ),

                const SizedBox(height: 10),

                /// Details Field
                const ExchangeDetailsField(),

                const SizedBox(height: 40),

                /// Confirm Button
                SizedBox(
                  width: double.infinity,
                  height: 52,

                  child: ElevatedButton(

                    onPressed: controller.confirmExchange,

                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryOrange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),

                    child: const Text(
                      "Confirm Exchange",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}