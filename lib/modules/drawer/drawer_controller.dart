import 'package:get/get.dart';

class DrawerControllerX extends GetxController {

  String userName = "Sam";
  String userRole = "Store Manager";
  String profileImage =
      "https://i.pravatar.cc/150?img=3";

  void goToOrders() {
    Get.back();
    Get.toNamed('/orders');
  }

  void askQuestion() {
    Get.back();
    Get.toNamed('/ask-question');
  }

  void openTerms() {
    Get.back();
    Get.toNamed('/terms');
  }

  void openFaq() {
    Get.back();
    Get.toNamed('/faq');
  }

  void openPrivacy() {
    Get.back();
    Get.toNamed('/privacy');
  }

  void openReturnPolicy() {
    Get.back();
    Get.toNamed('/return-policy');
  }

  void callUs() {
    Get.back();
  }

  void logout() {
    Get.back();
    Get.offAllNamed('/login');
  }
}