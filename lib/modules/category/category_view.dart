import 'package:e_comm/modules/category/category_navigator.dart';
import 'package:e_comm/modules/category/widgets/category_header.dart';
import 'package:e_comm/modules/category/widgets/vendor_fliter_tab.dart';
import 'package:e_comm/modules/category/widgets/vendor_grid.dart';
import 'package:e_comm/modules/mian_shell/main_shell_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/app_colors.dart';
import '../dashboard/widgets/search_bar.dart';
import 'category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // 🔥 prevent auto pop
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          final nestedNavigator =
              CategoryNavigator.navigatorKey.currentState;

          // If nested stack can pop → pop inside tab
          if (nestedNavigator != null && nestedNavigator.canPop()) {
            nestedNavigator.pop();
          } else {
            // If at root of category tab → switch to Dashboard
            final mainController = Get.find<MainShellController>();
            mainController.changeTab(0);
          }
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        extendBody: true,
        body: SafeArea(
          bottom: false,
          child: GetBuilder<CategoryController>(
            builder: (controller) {
              return Column(
                children: [

                  /// 🔹 Header
                  CategoryHeader(
                    isGrocery: controller.isGrocery,
                    onToggle: controller.toggleTheme,
                    onBack: () {
                      final nestedNavigator =
                          CategoryNavigator.navigatorKey.currentState;

                      if (nestedNavigator != null &&
                          nestedNavigator.canPop()) {
                        nestedNavigator.pop();
                      } else {
                        final mainController =
                        Get.find<MainShellController>();
                        mainController.changeTab(0);
                      }
                    },
                  ),

                  /// 🔹 Search
                  SearchBarSection(
                    accent: controller.accent,
                  ),

                  /// 🔹 Filter Tabs
                  VendorFilterTabs(
                    selectedIndex: controller.selectedFilterIndex,
                    onTabChanged: controller.changeFilter,
                    accent: controller.accent,
                  ),

                  const SizedBox(height: 12),

                  /// 🔹 Vendor Grid
                  Expanded(
                    child: VendorGrid(
                      vendors: controller.currentVendors,
                      onVendorTap: controller.openVendor,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}