import 'package:e_comm/modules/cart/cart_view.dart';
import 'package:e_comm/modules/category/category_navigator.dart';
import 'package:e_comm/modules/orders/orders_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';
import '../dashboard/dashboard_view.dart';
import '../dashboard/widgets/floating_nav_bar.dart';
import '../wishlist/wishlist_view.dart';
import 'main_shell_controller.dart';

class MainShellView extends GetView<MainShellController> {
  const MainShellView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainShellController>(
      builder: (controller) {
        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            if (!didPop) {

              /// 🔹 Handle nested Category navigation
              if (controller.currentIndex == 1) {
                final nested =
                    CategoryNavigator.navigatorKey.currentState;
                if (nested != null && nested.canPop()) {

                  // 🔹 If we are popping ProductListing, restore nav
                  if (nested.canPop()) {
                    Get.find<MainShellController>().showNav();
                  }

                  nested.pop();
                  return;
                }
              }

              /// 🔹 If cart opened from product → return to product
              if (controller.currentIndex == 2 &&
                  controller.openedCartFromProduct &&
                  controller.returnProduct != null) {

                controller.changeTab(1, showNav: false);

                Future.delayed(const Duration(milliseconds: 80), () {
                  CategoryNavigator.navigatorKey.currentState?.pushNamed(
                    AppRoutes.productDetails,
                    arguments: controller.returnProduct,
                  );
                });

                controller.openedCartFromProduct = false;
                controller.returnProduct = null;

                return;
              }

              /// Default behavior
              if (controller.currentIndex != 0) {
                controller.changeTab(0);
                return;
              }

              /// 🔹 Exit app
              Navigator.of(context).pop();
            }
          },
          child: Scaffold(
            backgroundColor: Colors.transparent,
            extendBody: true,

            body: IndexedStack(
              index: controller.currentIndex,
              children: const [
                DashboardView(),
                CategoryNavigator(),
                CartView(),
                OrdersView(),
                WishlistView(),
              ],
            ),

            /// 🔹 NAV BAR (with hide ability)
            bottomNavigationBar: controller.showNavBar
                ? FloatingNavBar(
              selectedIndex: controller.currentIndex,
              onItemSelected: controller.changeTab,
            )
                : const SizedBox(),
          ),
        );
      },
    );
  }
}