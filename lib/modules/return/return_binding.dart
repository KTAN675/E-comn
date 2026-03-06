import 'package:get/get.dart';
import 'return_controller.dart';

class ReturnBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReturnController());
  }
}