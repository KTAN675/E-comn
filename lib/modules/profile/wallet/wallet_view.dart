import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant/app_colors.dart';
import '../../../routes/app_routes.dart';
import 'wallet_controller.dart';
import 'widgets/wallet_balance_card.dart';
import 'widgets/gift_voucher_card.dart';
import 'widgets/wallet_action_button.dart';

class WalletView extends GetView<WalletController> {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        leading: const BackButton(color: Colors.black),
        centerTitle: true,
        title: const Text(
          "My Wallet",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            /// Balance Card
            Obx(() => WalletBalanceCard(
              balance: controller.balance.value,
            )),

            const SizedBox(height: 20),

            /// Gift Voucher Card
            const GiftVoucherCard(),

            const Spacer(),

            /// Withdraw Button
            WalletActionButton(
              title: "Withdraw",
              onTap: () {
                Get.toNamed(AppRoutes.withdraw);
              },
            ),

            const SizedBox(height: 15),

            /// Add Balance Button
            WalletActionButton(
              title: "Add Balance",
              onTap: () {
                Get.toNamed(AppRoutes.add_balance);
              },
            ),

            const SizedBox(height: 20),

            /// Redeem
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Have a gift voucher ? ",
                  style: TextStyle(color: Colors.grey),
                ),
                GestureDetector(
                  onTap: () {
                    controller.redeemVoucher("CODE123");
                  },
                  child: Text(
                    "Redeem Now",
                    style: TextStyle(
                      color: AppColors.primaryOrange,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ],
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}