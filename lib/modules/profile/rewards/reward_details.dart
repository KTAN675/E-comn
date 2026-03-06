import 'package:e_comm/modules/profile/rewards/widgets/reward_success_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant/app_colors.dart';
import '../../../constant/app_text_styles.dart';
import '../../../utils/app_primary_button.dart';

class RewardDetailsView extends StatelessWidget {

  final Map<String,String> reward;

  const RewardDetailsView({super.key, required this.reward});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.white,

      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: Text(
          "Reward Details",
          style: AppTextStyles.h2,
        ),
        actions: [

          IconButton(
            icon: const Icon(Icons.close,color: Colors.black),
            onPressed: () => Get.back(),
          )
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// IMAGE
            ClipRRect(
              borderRadius: BorderRadius.circular(20),

              child: Image.asset(
                "assets/images/reward_fruits2.png",
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 20),

            /// TITLE
            Text(
              reward["title"]!,
              style: AppTextStyles.h1,
            ),

            const SizedBox(height: 6),

            /// SUBTITLE
            Text(
              reward["subtitle"]!,
              style: AppTextStyles.bodyGrey,
            ),

            const SizedBox(height: 24),

            /// INSTRUCTION BOX
            Container(
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: const Color(0xffF2F2F2),
                borderRadius: BorderRadius.circular(20),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  Text(
                    "Redemption Instructions:",
                    style: AppTextStyles.bodyLarge,
                  ),

                  const SizedBox(height: 16),

                  instruction("1. Valid Only On Your First Order."),
                  instruction("2. Minimum Cart Value Must Be ₹999 Or Above."),
                  instruction("3. Discount Will Be Applied At Checkout."),
                  instruction("4. Offer Cannot Be Combined With Other Coupons."),
                  instruction("5. Valid For A Limited Time Only."),
                  instruction("6. Applicable On Selected Categories."),
                ],
              ),
            ),

            const Spacer(),

            /// REDEEM BUTTON
            AppPrimaryButton(
              title: "Redeem",
              onTap: () {
                Get.dialog(
                  const RewardSuccessDialog(),
                  barrierDismissible: false,
                );
              },
            ),

            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }

  Widget instruction(String text){
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: AppTextStyles.bodyGrey,
      ),
    );
  }

}