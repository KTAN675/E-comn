import 'package:e_comm/modules/profile/subscription/subscription_controller.dart';
import 'package:get/get.dart';

class SubscriptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubscriptionController>(
          () => SubscriptionController(),
    );
  }
}