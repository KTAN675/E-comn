import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';
import '../../mian_shell/main_shell_controller.dart';
import '../../category/category_navigator.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final shell = Get.find<MainShellController>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [

          /// 🔹 Back Button
          IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {

              /// If cart opened from product
              if (shell.openedCartFromProduct &&
                  shell.returnProduct != null) {

                shell.changeTab(1, showNav: false);

                Future.delayed(const Duration(milliseconds: 80), () {
                  CategoryNavigator.navigatorKey.currentState?.pushNamed(
                    AppRoutes.productDetails,
                    arguments: shell.returnProduct,
                  );
                });

                shell.openedCartFromProduct = false;
                shell.returnProduct = null;
                return;
              }

              /// Default → go to dashboard
              shell.changeTab(0);
            },
          ),

          const SizedBox(width: 6),

          /// 🔹 Title
          const Text(
            "Cart",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}