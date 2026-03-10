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
import 'widgets/categories_section.dart';
import '../drawer/drawer_view.dart'; // ← import your DrawerView

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  /// Opens the drawer as an Overlay — renders above BottomNavigationBar
  /// and shows the real screen behind the scrim (no black background).
  void _openDrawer(BuildContext context) {
    // ← Register the controller if not already registered
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
                    onLocationTap: () => _openDrawer(context),           // avatar + name → drawer
                   onAddressTap: () => Get.toNamed(AppRoutes.address),  // address row → address page
                    onNotificationTap: () => Get.toNamed(AppRoutes.notification),
                  ),

                  const SizedBox(height: 8),

                  /// 🔹 Search
                  SearchBarSection(),

                  /// 🔹 Categories
                  // CategoriesSection(
                  //   categories: controller.currentCategories,
                  //   selectedIndex: controller.selectedCategoryIndex,
                  //   onCategoryTap: controller.openCategory,
                  // ),

                  // const SizedBox(height: 10),
                  //
                  // /// 🔹 Vendors
                  // VendorsSection(
                  //   vendors: controller.currentVendors,
                  //   selectedIndex: controller.selectedVendorIndex,
                  //   onVendorTap: controller.changeVendor,
                  // ),
                  const SizedBox(height: 20),

                  /// 🔹 Tab Section
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

                 // const SizedBox(height: 20),

                  /// 🔹 Flash Sale
                  // FlashSaleSection(
                  //  // title: "Flash Sale 🔥",
                  //   products: controller.flashProducts,
                  //   backgroundColor: controller.flashSectionBg,
                  // ),

                  /// 🔹 Today's Specials
                  // ProductsSection(
                  //   title: "Today's Specials",
                  //   products: controller.todaysSpecials,
                  // ),

                  // /// 🔹 Inspiration
                  // if (controller.showInspiration)
                  //   InspirationSection(
                  //     items: controller.inspirations,
                  //   ),

                  // const SizedBox(height: 20),
                  //
                  // /// 🔹 Tab Section
                  // TabSection(
                  //   tabs: const [
                  //     "Today's Choices",
                  //     "Limited Discount!",
                  //     "Cheapest!",
                  //   ],
                  //   selectedIndex: controller.selectedTabIndex,
                  //   onTabChanged: controller.changeTab,
                  //   tabViews: [
                  //     ProductsGrid(products: controller.currentTabProducts),
                  //     ProductsGrid(products: controller.limitedDiscount),
                  //     ProductsGrid(products: controller.cheapest),
                  //   ],
                  // ),

                 // const SizedBox(height: 10),
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
