
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realtime_user/modules/profile/subscription/subscription_controller.dart';
import 'package:realtime_user/modules/profile/subscription/widgets/benefits_section.dart';
import 'package:realtime_user/modules/profile/subscription/widgets/subscribe_button.dart';
import 'package:realtime_user/modules/profile/subscription/widgets/subscription_banner.dart';
import 'package:realtime_user/modules/profile/subscription/widgets/subscription_plan_tile.dart';

import '../../../constant/app_colors.dart';

class SubscriptionView extends GetView<SubscriptionController> {
  const SubscriptionView({super.key});


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SubscriptionController());
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SubscriptionBanner(),
            const SizedBox(height: 24),
            const BenefitsSection(),
            const SizedBox(height: 24),

            /// Plans
            Obx(() => Column(
              children: [
                SubscriptionPlanTile(
                  title: "Monthly",
                  price: 100,
                  type: SubscriptionType.monthly,
                  isSelected: controller.selectedPlan.value ==
                      SubscriptionType.monthly,
                ),
                SubscriptionPlanTile(
                  title: "Yearly",
                  price: 1200,
                  type: SubscriptionType.yearly,
                  isBestValue: true,
                  isSelected: controller.selectedPlan.value ==
                      SubscriptionType.yearly,
                ),
                SubscriptionPlanTile(
                  title: "Weekly",
                  price: 50,
                  type: SubscriptionType.weekly,
                  isSelected: controller.selectedPlan.value ==
                      SubscriptionType.weekly,
                ),
              ],
            )),
            const SizedBox(height: 30),
          ],
        ),
      ),
      bottomNavigationBar: const SubscribeButton(),
    );
  }
}