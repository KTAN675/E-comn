
import 'package:get/get.dart';
import 'package:realtime_user/modules/profile/subscription/subscription_controller.dart';

class SubscriptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubscriptionController>(
          () => SubscriptionController(),
    );
  }
}