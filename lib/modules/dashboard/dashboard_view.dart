import 'package:e_comm/modules/dashboard/widgets/search_bar.dart';
import 'package:e_comm/modules/dashboard/widgets/vendor_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/app_colors.dart';
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
                  GetBuilder<DashboardController>(
                    builder: (controller) {
                      return BannerSection(
                        imagePath: controller.bannerImage,
                        isGrocery: controller.isGrocery,
                        onToggle: controller.toggleTheme,
                      );
                    },
                  ),
                  /// 🔹 Search
                  const SearchBarSection(),

                  /// 🔹 Categories
                  CategoriesSection(
                    categories: [
                      CategoryModel(title: "Vegetable", image: 'assets/images/icons/vegetable.png', ),
                      CategoryModel(title: "Fruit", image: 'assets/images/icons/fruits.png', ),
                      CategoryModel(title: "Meat", image: 'assets/images/icons/meat.png', ),
                      CategoryModel(title: "Seafood", image: 'assets/images/icons/seafood.png', ),
                      CategoryModel(title: "Protein", image: 'assets/images/icons/protine.png', ),
                    ],
                    selectedIndex: controller.selectedCategoryIndex,
                    onCategoryTap: controller.changeCategory,
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
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}