import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant/app_colors.dart';
import '../../../constant/app_text_styles.dart';
import '../../../utils/app_primary_button.dart';
import 'rewards_controller.dart';

class RewardsView extends GetView<RewardsController> {
  const RewardsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RewardsController());

    return Scaffold(
      backgroundColor: AppColors.white,

      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        title: Text("Rewards", style: AppTextStyles.h2),
        leading: const BackButton(color: Colors.black),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// BANNER
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.primaryOrange,
                borderRadius: BorderRadius.circular(24),
              ),

              child: Row(
                children: [

                  /// TEXT
                  Expanded(
                    child: Text(
                      "Redeem Your\nPoints And\nEnjoy Instant\nSavings.",
                      style: AppTextStyles.h2.copyWith(
                        color: Colors.white,
                        height: 1.3,
                      ),
                    ),
                  ),

                  /// IMAGE
                  Image.asset(
                    "assets/images/reward_fruits.png",
                    height: 110,
                  )
                ],
              ),
            ),

            const SizedBox(height: 28),

            /// ACCUMULATE HEADER
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text("Accumulate Points", style: AppTextStyles.h3),

                Text(
                  "View All >",
                  style: AppTextStyles.bodyGrey,
                )
              ],
            ),

            const SizedBox(height: 14),

            rewardTask(
              icon: Icons.mail_outline,
              title: "Email Verification",
              subtitle: "Earn 100 Points",
              button: "Go",
            ),

            const SizedBox(height: 12),

            rewardTask(
              icon: Icons.shopping_bag_outlined,
              title: "Make A Purchase",
              subtitle: "Earn Points",
              button: "Shop Now",
            ),

            const SizedBox(height: 28),

            /// REWARDS HEADER
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text("Your Rewards", style: AppTextStyles.h3),

                Text(
                  "View All >",
                  style: AppTextStyles.bodyGrey,
                )
              ],
            ),

            const SizedBox(height: 16),

            /// GRID
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),

              itemCount: controller.rewards.length,

              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: 0.9,
              ),

              itemBuilder: (context, index) {

                final reward = controller.rewards[index];

                return rewardCard(reward);
              },
            )
          ],
        ),
      ),
    );
  }

  /// TASK CARD
  Widget rewardTask({
    required IconData icon,
    required String title,
    required String subtitle,
    required String button,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),

      decoration: BoxDecoration(
        color: const Color(0xffE9E0D9),
        borderRadius: BorderRadius.circular(20),
      ),

      child: Row(
        children: [

          Icon(icon, color: AppColors.primaryOrange, size: 28),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(title, style: AppTextStyles.bodyLarge),

                Text(subtitle, style: AppTextStyles.bodyGrey),
              ],
            ),
          ),

          /// PILL BUTTON
          Container(
            padding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 8),

            decoration: BoxDecoration(
              color: AppColors.primaryOrange,
              borderRadius: BorderRadius.circular(30),
            ),

            child: Text(
              button,
              style: AppTextStyles.bodyLarge.copyWith(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  /// REWARD CARD
  Widget rewardCard(Map<String, String> reward) {
    return Container(
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: const Color(0xffF6EFEA),
        borderRadius: BorderRadius.circular(22),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [

          Column(
            children: [

              Text(
                reward["title"]!,
                style: AppTextStyles.h2,
              ),

              const SizedBox(height: 6),

              Text(
                reward["subtitle"]!,
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyGrey,
              ),
            ],
          ),

          GestureDetector(
            onTap: () {
              Get.find<RewardsController>().openReward(reward);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.primaryOrange,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                "Redeem",
                style: AppTextStyles.bodyLarge.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}