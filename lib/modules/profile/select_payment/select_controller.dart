import 'package:get/get.dart';

class SelectController extends GetxController {
  var selectedPayment = "upi".obs;

  void selectPayment(String type) {
    selectedPayment.value = type;
  }
}