import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant/app_colors.dart';
import '../exchange_controller.dart';


class ExchangeConfirmButton extends GetView<ExchangeController> {
  const ExchangeConfirmButton({super.key});

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
          "Confirm Exchange",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}