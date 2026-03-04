import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../subscription_controller.dart';

class SubscribeButton extends GetView<SubscriptionController> {
  const SubscribeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Container(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: () {
            Get.snackbar(
              "Subscribed",
              "You selected ${controller.selectedPlanName} plan for ₹${controller.selectedPrice}",
            );
          },
          child: Text(
            "Subscribe at ₹ ${controller.selectedPrice}",
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}