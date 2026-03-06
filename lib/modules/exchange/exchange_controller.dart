import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../mian_shell/main_shell_controller.dart';

class ExchangeController extends GetxController {

  String? selectedReason;
  String additionalDetails = "";

  final List<String> reasons = [
    "Wrong item",
    "Size issue",
    "Color mismatch",
    "Product damaged",
  ];

  void selectReason(String reason) {
    selectedReason = reason;
    update();
  }

  void confirmExchange() {

    if (selectedReason == null) {
      Fluttertoast.showToast(
        msg: "Please select exchange reason",
      );
      return;
    }

    Fluttertoast.showToast(
      msg: "Exchange request submitted",
    );

    /// Navigate to Orders tab
    final mainController = Get.find<MainShellController>();

    Get.until((route) => route.isFirst);
    mainController.changeTab(3); // Orders tab
  }
}