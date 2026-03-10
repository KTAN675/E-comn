
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realtime_user/modules/products/widgets/listing_product_grid.dart';
import 'package:realtime_user/modules/products/widgets/sub_category_list.dart';
import '../../constant/app_colors.dart';
import '../category/category_navigator.dart';
import '../mian_shell/main_shell_controller.dart';
import 'product_listing_controller.dart';

class ProductListingView extends GetView<ProductListingController> {
  const ProductListingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: GetBuilder<ProductListingController>(
          builder: (controller) {
            return Column(
              children: [

                /// HEADER
                _ProductHeader(
                  title: controller.subCategories[
                  controller.selectedSubIndex],
                  accent: controller.accent,
                  onBack: () {
                    Get.find<MainShellController>().showNav();
                    CategoryNavigator.navigatorKey.currentState?.pop();
                  },
                ),

                Expanded(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 95,
                        child: SubCategoryList(
                          categories: controller.subCategoriesModel,
                          selectedIndex: controller.selectedSubIndex,
                          onTap: controller.changeSubCategory,
                          accent: controller.accent,
                          controller: controller.subCategoryScroll,
                        ),
                      ),
                      Expanded(
                        child: ListingProductsGrid(
                          products: controller.currentProducts,
                          accent: controller.accent,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}


class _ProductHeader extends StatelessWidget {
  final String title;
  final Color accent;
  final VoidCallback onBack;

  const _ProductHeader({
    required this.title,
    required this.accent,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding:
        const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        child: Row(
          children: [

            InkWell(
              onTap: onBack,
              borderRadius: BorderRadius.circular(12),
              child: const Padding(
                padding: EdgeInsets.all(6),
                child: Icon(Icons.arrow_back),
              ),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  height: 1.1,
                ),
              ),
            ),

            Icon(Icons.search, color: accent),
            const SizedBox(width: 16),
            Icon(Icons.favorite_border, color: accent),
          ],
        ),
      ),
    );
  }
}