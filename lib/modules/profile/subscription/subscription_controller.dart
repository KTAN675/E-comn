import 'package:get/get.dart';

enum SubscriptionType { monthly, yearly, weekly }

class SubscriptionController extends GetxController {
  final selectedPlan = SubscriptionType.monthly.obs;

  final plans = {
    SubscriptionType.monthly: 100,
    SubscriptionType.yearly: 1200,
    SubscriptionType.weekly: 50,
  };

  void selectPlan(SubscriptionType type) {
    selectedPlan.value = type;
  }

  int get selectedPrice => plans[selectedPlan.value] ?? 0;

  String get selectedPlanName {
    switch (selectedPlan.value) {
      case SubscriptionType.monthly:
        return "Monthly";
      case SubscriptionType.yearly:
        return "Yearly";
      case SubscriptionType.weekly:
        return "Weekly";
    }
  }

  /// Optional: If you want navigation from controller
  void goToSubscription() {
    Get.toNamed('/subscription');
  }
}