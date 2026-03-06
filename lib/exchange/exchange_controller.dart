import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExchangeController extends GetxController {

  /// Exchange reason list
  final List<String> reasons = [
    "Wrong item",
    "Size issue",
    "Damaged product",
    "Quality not good",
    "Other"
  ];

  /// Selected reason
  RxString selectedReason = "Wrong item".obs;

  /// Details controller
  final TextEditingController detailsController = TextEditingController();

  /// Timeline current step
  RxInt currentStep = 2.obs;

  /// Change dropdown reason
  void changeReason(String? value) {
    if (value != null) {
      selectedReason.value = value;
    }
  }

  /// Confirm exchange
  void confirmExchange() {

    if (detailsController.text.trim().isEmpty) {
      Get.snackbar(
        "Required",
        "Please enter additional details",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    /// simulate exchange request success
    currentStep.value = 0;

    /// Navigate to tracking screen
    Get.toNamed("/track-exchange");
  }

  /// Confirm return (added without changing your button logic)
  void confirmReturn() {

    if (detailsController.text.trim().isEmpty) {
      Get.snackbar(
        "Required",
        "Please enter additional details",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    /// simulate return request success
    currentStep.value = 0;

    /// Navigate to return tracking screen
    Get.toNamed("/track-return");
  }

  @override
  void onClose() {
    detailsController.dispose();
    super.onClose();
  }
  void submitReturn() {
    if(selectedReason.value.isEmpty){
      Get.snackbar("Error", "Please select return reason");
      return;
    }

    Get.snackbar("Success", "Return request submitted");
  }
}