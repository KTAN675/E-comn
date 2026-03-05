import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../constant/app_colors.dart';
import '../dashboard/widgets/vendor_section.dart';
import '../theme/theme_controller.dart';
import 'category_navigator.dart';

class CategoryController extends GetxController {

  /// 🔹 GLOBAL THEME CONTROLLER
  final ThemeController theme = Get.find<ThemeController>();

  // =============================
  // LIFECYCLE
  // =============================

  @override
  void onInit() {
    super.onInit();

    /// Listen to theme changes
    theme.addListener(() {
      update();
    });
  }

  // =============================
  // THEME STATE
  // =============================

  bool get isGrocery => theme.isGrocery;

  Color get accent => AppColors.accent;

  // =============================
  // FILTER TABS
  // =============================

  int selectedFilterIndex = 0;

  void changeFilter(int index) {
    selectedFilterIndex = index;
    update();
  }

  // ==========================================================
  // DUMMY DATA (Like Dashboard)
  // ==========================================================

  List<VendorModel> groceryVendors = [
    VendorModel(
      name: "Tripische distributor Mumbai",
      subtitle: "5000 + Products",
      image: "assets/images/vendor1.png",
    ),
    VendorModel(
      name: "Starmall distributor Mumbai",
      subtitle: "4500 + Products",
      image: "assets/images/vendor2.png",
    ),
    VendorModel(
      name: "Sudhir distributor Mumbai",
      subtitle: "3200 + Products",
      image: "assets/images/vendor3.png",
    ),
    VendorModel(
      name: "Fresh Harvest Market",
      subtitle: "2100 + Products",
      image: "assets/images/vendor1.png",
    ),
    VendorModel(
      name: "City Organic Store",
      subtitle: "1800 + Products",
      image: "assets/images/vendor2.png",
    ),
    VendorModel(
      name: "City Organic Store",
      subtitle: "1800 + Products",
      image: "assets/images/vendor2.png",
    ),
    VendorModel(
      name: "City Organic Store",
      subtitle: "1800 + Products",
      image: "assets/images/vendor2.png",
    ),
    VendorModel(
      name: "City Organic Store",
      subtitle: "1800 + Products",
      image: "assets/images/vendor2.png",
    ),
    VendorModel(
      name: "City Organic Store",
      subtitle: "1800 + Products",
      image: "assets/images/vendor2.png",
    ),
    VendorModel(
      name: "City Organic Store",
      subtitle: "1800 + Products",
      image: "assets/images/vendor2.png",
    ),
    VendorModel(
      name: "City Organic Store",
      subtitle: "1800 + Products",
      image: "assets/images/vendor2.png",
    ),
    VendorModel(
      name: "City Organic Store",
      subtitle: "1800 + Products",
      image: "assets/images/vendor2.png",
    ),
    VendorModel(
      name: "City Organic Store",
      subtitle: "1800 + Products",
      image: "assets/images/vendor2.png",
    ),
  ];

  List<VendorModel> medicineVendors = [
    VendorModel(
      name: "Wellness Medical Mumbai",
      subtitle: "4000 + Products",
      image: "assets/images/medicine/pharmacy1.png",
    ),
    VendorModel(
      name: "24/7 Medical Mumbai",
      subtitle: "1000 + Products",
      image: "assets/images/medicine/pharmacy2.png",
    ),
    VendorModel(
      name: "PharmaCare Store",
      subtitle: "2000 + Products",
      image: "assets/images/medicine/pharmacy3.png",
    ),
    VendorModel(
      name: "City Pharmacy Hub",
      subtitle: "1500 + Products",
      image: "assets/images/medicine/pharmacy1.png",
    ),
  ];

  // ==========================================================
  // FILTERED VENDORS
  // ==========================================================

  List<VendorModel> get currentVendors {

    final baseList = isGrocery
        ? groceryVendors
        : medicineVendors;

    switch (selectedFilterIndex) {

      case 1: // Near by
        return baseList.take(2).toList();

      case 2: // Available
        return baseList.reversed.toList();

      default:
        return baseList;
    }
  }

  // ==========================================================
  // NAVIGATION
  // ==========================================================

  void openVendor(VendorModel vendor) {

    CategoryNavigator.navigatorKey.currentState!
        .pushNamed('/vendor-categories');
  }
}