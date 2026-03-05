import 'package:get/get.dart';
import '../../data/models/order/order_model.dart';

class OrdersController extends GetxController {

  List<OrderModel> orders = [

    OrderModel(
      status: "Order Delivered",
      date: "Placed at 7th oct 2025, 1:22 pm",
      amount: 300,
      images: [
        "assets/images/products/dragon.png",
        "assets/images/products/grapes.png",
        "assets/images/products/banana.png",
      ],
    ),

    OrderModel(
      status: "Order Cancelled",
      date: "Placed at 7th oct 2025, 1:22 pm",
      amount: 500,
      images: [
        "assets/images/medicine/cold_relief.png",
        "assets/images/medicine/med1.png",
      ],
    ),

    OrderModel(
      status: "Order Delivered",
      date: "Placed at 7th oct 2025, 1:22 pm",
      amount: 221,
      images: [
        "assets/images/products/orange.png",
        "assets/images/products/apple.png",
      ],
    ),
  ];
}