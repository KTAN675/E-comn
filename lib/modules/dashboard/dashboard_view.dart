import 'package:e_comm/modules/dashboard/widgets/floating_nav_bar.dart';
import 'package:e_comm/modules/dashboard/widgets/inspirational_section.dart';
import 'package:e_comm/modules/dashboard/widgets/product_section.dart';
import 'package:e_comm/modules/dashboard/widgets/search_bar.dart';
import 'package:e_comm/modules/dashboard/widgets/vendor_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/app_colors.dart';
import '../../utils/custom_product_grid.dart';
import '../../utils/custom_tab_section.dart';
import 'dashboard_controller.dart';
import 'widgets/header_section.dart';
import 'widgets/banner_section.dart';
import 'widgets/categories_section.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      /// 🔹 Bottom Nav
      bottomNavigationBar: GetBuilder<DashboardController>(
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: FloatingNavBar(
              selectedIndex: controller.bottomNavIndex,
              onItemSelected: controller.changeBottomNav,
              accent: controller.accent, // 🔥 injected
            ),
          );
        },
      ),

      body: SafeArea(
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
                    onNotificationTap: () {},
                    onLocationTap: () {},
                  ),

                  const SizedBox(height: 8),

                  /// 🔹 Banner
                  BannerSection(
                    imagePath: controller.bannerImage,
                    isGrocery: controller.isGrocery,
                    onToggle: controller.toggleTheme,
                  ),

                  const SearchBarSection(),

                  /// 🔹 Categories
                  CategoriesSection(
                    categories: controller.currentCategories,
                    selectedIndex: controller.selectedCategoryIndex,
                    onCategoryTap: controller.changeCategory,
                    lightAccent: controller.lightAccent,
                  ),

                  const SizedBox(height: 10),

                  /// 🔹 Vendors
                  VendorsSection(
                    vendors: [
                      VendorModel(
                        name: "Tripische distributor, Mumbai",
                        subtitle: "5000 + Products",
                        image: "assets/images/vendor1.png",
                      ),
                      VendorModel(
                        name: "Starmall distributor, Mumbai",
                        subtitle: "5000 + Products",
                        image: "assets/images/vendor2.png",
                      ),
                    ],
                    selectedIndex: controller.selectedVendorIndex,
                    onVendorTap: controller.changeVendor,
                    accent: controller.accent, lightAccent: controller.lightAccent,
                  ),

                  const SizedBox(height: 20),

                  /// 🔹 Flash Sale
                  ProductsSection(
                    title: "Flash Sale 🔥",
                    products: controller.flashProducts,
                    accent: controller.accent,
                    backgroundColor: controller.flashSectionBg,
                  ),

                  /// 🔹 Today’s Specials
                  ProductsSection(
                    title: "Today’s Specials",
                    products: controller.todaysSpecials,
                    accent: controller.accent,
                  ),

                  /// 🔹 Inspiration
                  InspirationSection(
                    items: controller.inspirations,
                  ),

                  const SizedBox(height: 20),

                  /// 🔹 Tab Section
                  TabSection(
                    tabs: const [
                      "Today's Choices",
                      "Limited Discount!",
                      "Cheapest!",
                    ],
                    selectedIndex: controller.selectedTabIndex,
                    onTabChanged: controller.changeTab,
                    tabViews: [
                      ProductsGrid(
                        products: controller.todaysChoices,
                        accent: controller.accent,
                        discountColor: controller.accent,
                      ),
                      ProductsGrid(
                        products: controller.limitedDiscount,
                        accent: controller.accent,
                        discountColor: controller.accent,
                      ),
                      ProductsGrid(
                        products: controller.cheapest,
                        accent: controller.accent,
                        discountColor: controller.accent,
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}