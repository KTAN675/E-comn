import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/app_colors.dart';
import '../../constant/app_text_styles.dart';
import '../../modules/theme/theme_controller.dart';
import '../../utils/custom_product_grid.dart';
import 'wishlist_controller.dart';

class WishlistView extends GetView<WishlistController> {
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (theme) {
        final Color accent = AppColors.accent;

        return Scaffold(
          backgroundColor: AppColors.background,
          body: SafeArea(
            bottom: false,
            child: Column(
              children: [

                /// HEADER
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

                /// PRODUCTS GRID
                Expanded(
                  child: GetBuilder<WishlistController>(
                    builder: (ctrl) {
                      if (ctrl.wishlistProducts.isEmpty) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.favorite_border,
                                size: 60,
                                color: Colors.grey.shade400,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                "No items in wishlist",
                                style: AppTextStyles.bodyGrey,
                              ),
                            ],
                          ),
                        );
                      }
                      return SingleChildScrollView(
                        child: ProductsGrid(
                          products: ctrl.wishlistProducts,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}