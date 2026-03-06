import 'package:e_comm/modules/cart/cart_view.dart';
import 'package:e_comm/modules/category/category_navigator.dart';
import 'package:e_comm/modules/orders/orders_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/app_colors.dart';
import '../../constant/app_text_styles.dart';
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
              _showExitDialog(context);            }
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
  void _showExitDialog(BuildContext context) {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,

        child: Container(
          padding: const EdgeInsets.all(22),

          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20),
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: [

              /// ICON
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.primaryOrange.withValues(alpha: .1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.exit_to_app_rounded,
                  color: AppColors.primaryOrange,
                  size: 30,
                ),
              ),

              const SizedBox(height: 18),

              /// TITLE
              Text(
                "Exit App",
                style: AppTextStyles.h2,
              ),

              const SizedBox(height: 6),

              /// MESSAGE
              Text(
                "Are you sure you want to exit the app?",
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyGrey,
              ),

              const SizedBox(height: 24),

              /// BUTTONS
              Row(
                children: [

                  /// CANCEL
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        side: const BorderSide(color: AppColors.border),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () => Get.back(),
                      child: Text(
                        "Cancel",
                        style: AppTextStyles.buttonSecondary,
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  /// EXIT
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryOrange,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      child: Text(
                        "Exit",
                        style: AppTextStyles.button,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      barrierDismissible: true,
    );
  }}