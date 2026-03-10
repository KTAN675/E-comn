import 'package:realtime_user/modules/category/category_navigator.dart';
import 'package:realtime_user/modules/category/widgets/category_header.dart';
import 'package:realtime_user/modules/category/widgets/vendor_fliter_tab.dart';
import 'package:realtime_user/modules/category/widgets/vendor_grid.dart';
import 'package:realtime_user/modules/mian_shell/main_shell_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/app_colors.dart';
import '../dashboard/widgets/search_bar.dart';
import '../theme/theme_controller.dart';
import 'category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (_) {
        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            if (!didPop) {
              final nestedNavigator =
                  CategoryNavigator.navigatorKey.currentState;

              if (nestedNavigator != null && nestedNavigator.canPop()) {
                nestedNavigator.pop();
              } else {
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

                      /// Header
                      CategoryHeader(
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

                      /// Search
                      SearchBarSection(),

                      /// Filter Tabs
                      VendorFilterTabs(
                        selectedIndex: controller.selectedFilterIndex,
                        onTabChanged: controller.changeFilter,
                        accent: controller.accent,
                      ),

                      const SizedBox(height: 12),

                      /// Vendor Grid
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
      },
    );
  }
}