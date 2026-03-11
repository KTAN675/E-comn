import 'package:realtime_user/modules/dashboard/widgets/categories_section.dart';
import 'package:realtime_user/modules/dashboard/widgets/flash_sale.dart';
import 'package:realtime_user/modules/dashboard/widgets/inspirational_section.dart';
import 'package:realtime_user/modules/dashboard/widgets/product_section.dart';
import 'package:realtime_user/modules/dashboard/widgets/search_bar.dart';
import 'package:realtime_user/modules/dashboard/widgets/vendor_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/app_colors.dart';
import '../../routes/app_routes.dart';
import '../../utils/custom_product_grid.dart';
import '../../utils/custom_tab_section.dart';
import '../drawer/drawer_controller.dart';
import 'dashboard_controller.dart';
import 'widgets/header_section.dart';
import 'widgets/banner_section.dart';
//import 'widgets/categories_section.dart';
import '../drawer/drawer_view.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  void _openDrawer(BuildContext context) {
    if (!Get.isRegistered<DrawerControllerX>()) {
      Get.put(DrawerControllerX());
    }

    late OverlayEntry entry;
    entry = OverlayEntry(
      builder: (_) => DrawerView(
        onClose: () => entry.remove(),
      ),
    );
    Overlay.of(context).insert(entry);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      extendBody: true,
      body: SafeArea(
        bottom: false,
        child: GetBuilder<DashboardController>(
          builder: (controller) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// 🔹 Header
                  HeaderSection(
                    name: "Ghana",
                    address: "E /5001, Posh Complex Hatkesh U...",
                    onLocationTap: () => _openDrawer(context),
                    onAddressTap: () => Get.toNamed(AppRoutes.address),
                    onNotificationTap: () => Get.toNamed(AppRoutes.notification),
                  ),

                  /// 🔹 Search
                  SearchBarSection(),

                  /// 🔹 Tab Section (Categories / Flash Sale / Today's Specials)
                  Row(
                    children: [
                      Expanded(
                        child: TabSection(
                          tabs: const [
                            "Categories",
                            "Flash Sale",
                            "Today's Specials",
                          ],
                          selectedIndex: controller.selectedTabIndex,
                          onTabChanged: controller.changeTab,
                          tabViews: [

                            CategoriesSection(
                              products: controller.currentCategories,
                              categories: controller.currentCategories,
                              selectedIndex: controller.selectedCategoryIndex,
                              onCategoryTap: controller.openCategory,
                            ),

                            FlashSaleSection(products: controller.flashProducts),

                            ProductsSection(products: controller.todaysSpecials),
                          ],
                        ),
                      ),
                    ],
                  ),

                  /// 🔹 Vendors
                  VendorsSection(
                    vendors: controller.currentVendors,
                    selectedIndex: controller.selectedVendorIndex,
                    onVendorTap: controller.changeVendor,
                  ),

                  const SizedBox(height: 100),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}