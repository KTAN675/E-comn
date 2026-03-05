import 'package:e_comm/modules/orders/widgets/review_dialog.dart';
import 'package:get/get.dart';

class OrderItem {
  final String name;
  final int price;

  OrderItem(this.name, this.price);
}

class OrderDetailController extends GetxController {

  String orderId = "Oqw6213";
  String status = "Delivered";
  int itemCount = 3;
  int amount = 300;

  String receiver = "Ghana, +91 12345 87654";
  String vendor = "Starmall distributor - Andheri, Mumbai";
  String address = "Ceasor Road, azad nagar, andheri west";
  String date = "7th oct 2025, 1:22 pm";

  List<OrderItem> items = [
    OrderItem("2 Dragon Fruit", 100),
    OrderItem("2 Pack Grapes", 100),
    OrderItem("1 Pack Banana", 100),
  ];

  int itemTotal = 300;
  int platformFee = 5;
  int deliveryFee = 0;
  int tax = 10;
  int total = 315;

  void reorder() {
    Get.snackbar("Reorder", "Items added to cart");
  }

  void addReview() {
    Get.dialog(
      const ReviewDialog(),
      barrierDismissible: true,
    );
  }
}