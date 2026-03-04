import 'package:get/get.dart';

class WalletController extends GetxController {
  RxDouble balance = 1000.0.obs;

  void addBalance(double amount) {
    balance.value += amount;
  }

  void withdrawBalance(double amount) {
    if (balance.value >= amount) {
      balance.value -= amount;
    } else {
      Get.snackbar("Error", "Insufficient Balance");
    }
  }

  void redeemVoucher(String code) {
    // Future API call here
    Get.snackbar("Success", "Voucher Redeemed Successfully");
  }
}