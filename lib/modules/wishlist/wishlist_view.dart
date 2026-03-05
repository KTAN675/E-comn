import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/app_colors.dart';
import '../../constant/app_text_styles.dart';
import '../../utils/custom_product_grid.dart';
import '../dashboard/dashboard_controller.dart';
import 'wishlist_controller.dart';

class WishlistView extends GetView<WishlistController> {
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {

    final dashboardController = Get.find<DashboardController>();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [

            /// 🔹 Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: SizedBox(
                height: 40,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () => Get.back(),
                        child: const Icon(Icons.arrow_back),
                      ),
                    ),
                    Center(
                      child: Text(
                        "My Wishlist",
                        style: AppTextStyles.body.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 8),

            /// 🔹 Products Grid
            Expanded(
              child: SingleChildScrollView(
                child: ProductsGrid(
                  products: controller.wishlistProducts,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}