import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant/app_colors.dart';
import '../../../constant/app_text_styles.dart';
import 'select_controller.dart';
import 'widgets/payment_tile.dart';
import 'widgets/section_title.dart';

class SelectView extends GetView<SelectController> {
  const SelectView({super.key});

  @override
  Widget build(BuildContext context) {

    final accent = AppColors.accent;

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        foregroundColor: AppColors.black,
        centerTitle: true,

        title: Column(
          children: [
            Text(
              "Select Payment",
              style: AppTextStyles.h2.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 2),

            Text(
              "Add ₹100 To Wallet",
              style: AppTextStyles.bodyGrey.copyWith(
                fontSize: 13,
              ),
            )
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),

        child: ListView(
          children: [

            /// Preferred Payment
            const SectionTitle(title: "Preferred Payment"),

            Obx(
                  () => Column(
                children: [

                  /// UPI
                  PaymentTile(
                    leading: Container(
                      padding: const EdgeInsets.all(10),

                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),

                      child: Text(
                        "BHIM",
                        style: AppTextStyles.bodyLarge.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    title: "UPI",
                    subtitle: "********8317",

                    trailing: controller.selectedPayment.value == "upi"
                        ? CircleAvatar(
                      radius: 14,
                      backgroundColor: accent,
                      child: const Icon(
                        Icons.check,
                        size: 16,
                        color: Colors.white,
                      ),
                    )
                        : null,

                    onTap: () => controller.selectPayment("upi"),
                  ),

                  const SizedBox(height: 16),

                  /// PAY BUTTON
                  SizedBox(
                    width: double.infinity,

                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: accent,
                        padding: const EdgeInsets.symmetric(vertical: 16),

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),

                      onPressed: () {},

                      child: Text(
                        "Pay via UPI",
                        style: AppTextStyles.button.copyWith(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// Credit & Debit
            const SectionTitle(title: "Credit & Debit Card"),

            PaymentTile(
              leading: Container(
                padding: const EdgeInsets.all(10),

                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.border),
                  borderRadius: BorderRadius.circular(12),
                ),

                child: Icon(
                  Icons.add,
                  color: accent,
                ),
              ),

              title: "Add New Card",
              subtitle: "Save And Pay Via Cards",
            ),

            /// More Options
            const SectionTitle(title: "More Payment Options"),

            PaymentTile(
              leading: Container(
                padding: const EdgeInsets.all(10),

                decoration: BoxDecoration(
                  color: AppColors.lightAccent,
                  borderRadius: BorderRadius.circular(12),
                ),

                child: Icon(
                  Icons.account_balance,
                  color: accent,
                ),
              ),

              title: "Netbanking",
              subtitle: "select from a list of banks",
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}