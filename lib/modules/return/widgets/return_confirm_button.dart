import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant/app_colors.dart';
import '../return_controller.dart';

class ReturnConfirmButton extends GetView<ReturnController> {
  const ReturnConfirmButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: controller.submitReturn,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryOrange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          "Confirm Return",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}