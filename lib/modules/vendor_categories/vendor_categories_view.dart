import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/app_colors.dart';
import '../../modules/category/category_navigator.dart';
import '../../modules/category/widgets/category_header.dart';
import '../../modules/dashboard/widgets/search_bar.dart';
import '../theme/theme_controller.dart';
import 'vendor_categories_controller.dart';
import 'widgets/category_filter_tabs.dart';
import 'widgets/category_grid.dart';

class VendorCategoriesView extends GetView<VendorCategoriesController> {
  const VendorCategoriesView({super.key});

  void _safePop() {
    Future.microtask(() {
      final navigator = CategoryNavigator.navigatorKey.currentState;
      if (navigator != null && navigator.canPop()) {
        navigator.pop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (_) {
        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            if (!didPop) {
              _safePop();
            }
          },
          child: Scaffold(
            backgroundColor: AppColors.background,
            body: SafeArea(
              bottom: false,
              child: GetBuilder<VendorCategoriesController>(
                builder: (controller) {
                  return Column(
                    children: [
                      /// Header
                      CategoryHeader(
                        onBack: _safePop,
                      ),

                      /// Search Bar
                      const SearchBarSection(),

                      /// Filter Tabs
                      CategoryFilterTabs(
                        selectedIndex: controller.selectedFilterIndex,
                        onTabChanged: controller.changeFilter,
                        accent: controller.accent,
                      //  isMedicine: true,
                      ),

                      const SizedBox(height: 16),

                      /// Category Grid
                      Expanded(
                        child: CategoryGrid(
                          categories: controller.currentCategories,
                          onCategoryTap: controller.openCategory,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}