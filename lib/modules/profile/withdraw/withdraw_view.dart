import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant/app_colors.dart';
import '../../../constant/app_text_styles.dart';
import '../../../utils/app_primary_button.dart';
import 'withdraw_controller.dart';
import 'widgets/amount_chip.dart';

class WithdrawView extends GetView<WithdrawController> {
  const WithdrawView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        foregroundColor: AppColors.black,
        centerTitle: true,
        title: Text(
          "Withdraw",
          style: AppTextStyles.h2,
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            /// CARD
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    "Enter Amount",
                    style: AppTextStyles.bodyGrey.copyWith(
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(height: 15),

                  /// AMOUNT FIELD
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),

                    child: TextField(
                      controller: controller.amountController,
                      keyboardType: TextInputType.number,

                      style: AppTextStyles.bodyLarge,

                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                        prefixText: "₹",
                      ),

                      onChanged: controller.onAmountChanged,
                    ),
                  ),

                  const SizedBox(height: 25),

                  /// AMOUNT CHIPS
                  Obx(
                        () => Row(
                      children: controller.predefinedAmounts
                          .map(
                            (amount) => AmountChip(
                          amount: amount,
                          isSelected:
                          controller.selectedAmount.value ==
                              amount,
                          onTap: () =>
                              controller.selectAmount(amount),
                        ),
                      )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

            /// PROCEED BUTTON
            Obx(
                  () => AppPrimaryButton(
                title: "Proceed to withdraw",
                onTap: controller.proceedWithdraw,
                enabled: controller.isValidAmount,
              ),
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}