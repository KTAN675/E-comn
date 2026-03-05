import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../constant/app_colors.dart';
import '../../routes/app_routes.dart';
import '../dashboard/widgets/vendor_section.dart';
import 'category_navigator.dart';

enum CategoryTheme {
  grocery,
  medicine,
}

class CategoryController extends GetxController {

  // =============================
  // THEME STATE
  // =============================

  CategoryTheme currentTheme = CategoryTheme.grocery;

  bool get isGrocery => currentTheme == CategoryTheme.grocery;

  Color get accent =>
      isGrocery ? AppColors.primaryOrange : AppColors.secondaryCyan;

  // =============================
  // FILTER TABS
  // =============================

  int selectedFilterIndex = 0;

  void changeFilter(int index) {
    selectedFilterIndex = index;
    update();
  }

  // =============================
  // THEME TOGGLE
  // =============================

  void toggleTheme() {
    currentTheme = isGrocery
        ? CategoryTheme.medicine
        : CategoryTheme.grocery;

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
    ), VendorModel(
      name: "City Organic Store",
      subtitle: "1800 + Products",
      image: "assets/images/vendor2.png",
    ), VendorModel(
      name: "City Organic Store",
      subtitle: "1800 + Products",
      image: "assets/images/vendor2.png",
    ), VendorModel(
      name: "City Organic Store",
      subtitle: "1800 + Products",
      image: "assets/images/vendor2.png",
    ), VendorModel(
      name: "City Organic Store",
      subtitle: "1800 + Products",
      image: "assets/images/vendor2.png",
    ), VendorModel(
      name: "City Organic Store",
      subtitle: "1800 + Products",
      image: "assets/images/vendor2.png",
    ), VendorModel(
      name: "City Organic Store",
      subtitle: "1800 + Products",
      image: "assets/images/vendor2.png",
    ), VendorModel(
      name: "City Organic Store",
      subtitle: "1800 + Products",
      image: "assets/images/vendor2.png",
    ), VendorModel(
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
    final baseList = isGrocery ? groceryVendors : medicineVendors;

    switch (selectedFilterIndex) {
      case 1: // Near by (dummy logic)
        return baseList.take(2).toList();
      case 2: // Available (dummy logic)
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