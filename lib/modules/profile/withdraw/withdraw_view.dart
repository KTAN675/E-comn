import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/app_primary_button.dart';
import 'withdraw_controller.dart';
import 'widgets/amount_chip.dart';
//import '../../common/widgets/app_primary_button.dart';

class WithdrawView extends GetView<WithdrawController> {
  const WithdrawView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "Withdraw",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Grey Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xffEEEEEE),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Enter Amount",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 15),

                  /// Amount Field
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffE3E3E3),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: TextField(
                      controller: controller.amountController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                        prefixText: "₹",
                      ),
                      onChanged: controller.onAmountChanged,
                    ),
                  ),

                  const SizedBox(height: 25),

                  /// Chips
                  Obx(() => Row(
                    children: controller.predefinedAmounts
                        .map((amount) => AmountChip(
                      amount: amount,
                      isSelected:
                      controller.selectedAmount.value ==
                          amount,
                      onTap: () =>
                          controller.selectAmount(amount),
                    ))
                        .toList(),
                  )),
                ],
              ),
            ),

            const Spacer(),

            /// ✅ AppPrimaryButton
            Obx(() => AppPrimaryButton(
              title: "Proceed to withdraw",
              onTap: controller.proceedWithdraw,
              enabled: controller.isValidAmount,
            )),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}