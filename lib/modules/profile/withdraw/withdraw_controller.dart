import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';
//import '../../app/routes/app_routes.dart';

class WithdrawController extends GetxController {
  final TextEditingController amountController =
  TextEditingController(text: "100");

  RxInt selectedAmount = 100.obs;

  final List<int> predefinedAmounts = [100, 250, 500, 1000];

  bool get isValidAmount => selectedAmount.value > 0;

  void selectAmount(int amount) {
    selectedAmount.value = amount;
    amountController.text = amount.toString();
  }

  void onAmountChanged(String value) {
    selectedAmount.value = int.tryParse(value) ?? 0;
  }

  void proceedWithdraw() {
    if (!isValidAmount) return;

    Get.toNamed(
      AppRoutes.select_payment,
      arguments: selectedAmount.value,
    );
  }

  @override
  void onClose() {
    amountController.dispose();
    super.onClose();
  }
}