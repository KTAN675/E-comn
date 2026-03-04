import 'package:get/get.dart';
import 'add_balance_controller.dart';

class AddBalanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddBalanceController>(() => AddBalanceController());
  }
}
