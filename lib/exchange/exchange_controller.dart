import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExchangeController extends GetxController {

  /// dropdown values
  final reasons = [
    "Wrong item",
    "Size issue",
    "Damaged product",
    "Quality not good",
    "Other"
  ];

  RxString selectedReason = "Wrong item".obs;

  TextEditingController detailsController = TextEditingController();

  /// timeline step
  RxInt currentStep = 2.obs;

  void changeReason(String value) {
    selectedReason.value = value;
  }

  void confirmExchange() {

    /// simulate request success
    currentStep.value = 0;

    Get.toNamed("/track-exchange");
  }
}