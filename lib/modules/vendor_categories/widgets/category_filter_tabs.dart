import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/custom_tab_switcher.dart';
//import '../../category/vendor_categories_controller.dart';
import '../vendor_categories_controller.dart';

class CategoryFilterTabs extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChanged;
  final Color accent;

  const CategoryFilterTabs({
    super.key,
    required this.selectedIndex,
    required this.onTabChanged,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {

    final vendorController = Get.find<VendorCategoriesController>();

    /// 🔹 AUTO TAB CHANGE BASED ON VENDOR
    final List<String> tabs = vendorController.isGrocery
        ? const [
      "All Categories",
      "Quick Cook",
      "Healthy Life",
    ]
        : const [
      "All Categories",
      "Healthy Life",
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CommonTabSwitcher(
        tabs: tabs,
        selectedIndex: selectedIndex,
        onTabChanged: onTabChanged,
        accent: accent,
      ),
    );
  }
}