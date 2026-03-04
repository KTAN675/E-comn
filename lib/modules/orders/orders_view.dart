import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/app_colors.dart';
import '../../routes/app_routes.dart';
import 'orders_controller.dart';
import 'widgets/order_card.dart';

class OrdersView extends GetView<OrdersController> {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.white,

      appBar: AppBar(
        title: const Text("Your Orders"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.white,
      ),

      body: GetBuilder<OrdersController>(
        builder: (controller) {

          return ListView.builder(
            itemCount: controller.orders.length,
            itemBuilder: (context, index) {

              final order = controller.orders[index];

              return OrderCard(
                order: order,

                onTap: () {
                  Get.toNamed(
                    AppRoutes.ordersDetail,
                    arguments: order,
                  );
                },

                onReorder: () {
                  /// reorder logic
                },
              );
            },
          );
        },
      ),
    );
  }
}