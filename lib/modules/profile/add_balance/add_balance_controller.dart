import 'package:get/get.dart';

class AddBalanceController extends GetxController {
  var availableBalance = 1000.obs;
  var selectedAmount = 100.obs;

  final predefinedAmounts = [100, 250, 500, 1000];

  void selectAmount(int amount) {
    selectedAmount.value = amount;
  }

  void proceedToAddBalance() {
    // Example: update balance
    availableBalance.value += selectedAmount.value;

    Get.snackbar(
      "Success",
      "₹${selectedAmount.value} added to balance",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void redeemVoucher() {
    // Handle voucher redemption logic
    Get.snackbar("Voucher", "Redeem voucher clicked");
  }
}
