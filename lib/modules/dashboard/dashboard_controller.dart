import 'dart:ui';

import 'package:e_comm/modules/dashboard/widgets/categories_section.dart';
import 'package:e_comm/modules/dashboard/widgets/vendor_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/app_colors.dart';
import '../../data/models/product/inspriation_model.dart';
import '../../data/models/product/product_model.dart';
import '../../routes/app_routes.dart';
import '../mian_shell/main_shell_controller.dart';
import '../theme/theme_controller.dart';

class DashboardController extends GetxController {

  final ThemeController theme = Get.find<ThemeController>();

// Drawer Key
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  /// Open Drawer
  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  // =============================
  // UI SELECTION STATES
  // =============================

  int selectedCategoryIndex = 0;
  int selectedVendorIndex = -1;
  int selectedTabIndex = 0;

  // =============================
  // LIFECYCLE
  // =============================
  @override
  void onInit() {
    super.onInit();

    /// Listen to ThemeController updates
    theme.addListener(() {
      update();
    });

    loadDashboard();
  }
  void loadDashboard() {
    update();
  }

  // =============================
  // CATEGORY
  // =============================

  void changeCategory(int index) {
    selectedCategoryIndex = index;
    update();
  }

  // =============================
  // VENDOR
  // =============================

  void changeVendor(int index) {
    selectedVendorIndex = index;
    update();
  }

  // =============================
  // TAB SWITCHER
  // =============================

  void changeTab(int index) {
    selectedTabIndex = index;
    update();
  }

  // =============================
  // THEME STATE
  // =============================

  bool get isGrocery => theme.isGrocery;

  String get bannerImage =>
      isGrocery
          ? "assets/images/banner_grocery.png"
          : "assets/images/icons/medical.png";

  // ==========================================================
  // PRODUCTS DATA (Grocery)
  // ==========================================================

  List<ProductModel> groceryFlashProducts = [
    ProductModel(
      title: "Chicken breast frozen",
      image: "assets/images/products/chicken_breast.png",
      weight: "450–500gr /pack",
      price: 22.40,
      oldPrice: 32.00,
      discount: 30,
    ),
    ProductModel(
      title: "Chicken breast frozen",
      image: "assets/images/products/eggs.png",
      weight: "0.9–1kg /pack",
      price: 13.00,
      oldPrice: 20.00,
      discount: 35,
    ),
    ProductModel(
      title: "Beef meat slice",
      image: "assets/images/products/beef.png",
      weight: "450–500gr /pack",
      price: 30.00,
      oldPrice: 38.00,
      discount: 20,
    ),
  ];

  List<ProductModel> groceryTodaysSpecials = [
    ProductModel(
      title: "Australia beef tenderloin",
      image: "assets/images/products/chicken_breast.png",
      weight: "450–500gr /pack",
      price: 40.00,
      oldPrice: 50.00,
      discount: 20,
    ),
    ProductModel(
      title: "Omega chicken eggs",
      image: "assets/images/products/eggs.png",
      weight: "0.9–1kg /pack",
      price: 15.00,
    ),
    ProductModel(
      title: "Cavendish baby banana",
      image: "assets/images/products/beef.png",
      weight: "450–500gr /pack",
      price: 9.00,
    ),
  ];

  // ==========================================================
  // PRODUCTS DATA (Medicine)
  // ==========================================================

  List<ProductModel> medicineFlashProducts = [
    ProductModel(
      title: "ColdRelief Plus",
      image: "assets/images/medicine/cold_relief.png",
      weight: "1 /pack",
      price: 95,
      oldPrice: 120,
      discount: 10,
    ),
    ProductModel(
      title: "ColdRelief Plus",
      image: "assets/images/medicine/cold_relief.png",
      weight: "1 /pack",
      price: 95,
      oldPrice: 120,
      discount: 10,
    ),
    ProductModel(
      title: "ColdRelief Plus",
      image: "assets/images/medicine/cold_relief.png",
      weight: "1 /pack",
      price: 95,
      oldPrice: 120,
      discount: 10,
    ),
  ];

  List<ProductModel> medicineTodaysSpecials = [
    ProductModel(
      title: "ColdRelief Plus",
      image: "assets/images/medicine/cold_relief.png",
      weight: "1 /pack",
      price: 95,
      oldPrice: 120,
      discount: 10,
    ),
    ProductModel(
      title: "ColdRelief Plus",
      image: "assets/images/medicine/cold_relief.png",
      weight: "1 /pack",
      price: 95,
      oldPrice: 120,
      discount: 10,
    ),
    ProductModel(
      title: "ColdRelief Plus",
      image: "assets/images/medicine/cold_relief.png",
      weight: "1 /pack",
      price: 95,
      oldPrice: 120,
      discount: 10,
    ),
  ];

  List<ProductModel> get flashProducts =>
      isGrocery ? groceryFlashProducts : medicineFlashProducts;

  List<ProductModel> get todaysSpecials =>
      isGrocery ? groceryTodaysSpecials : medicineTodaysSpecials;

  // ==========================================================
  // TAB PRODUCTS
  // ==========================================================

  List<ProductModel> todaysChoices = [
    ProductModel(
      title: "MF chicken sausage cheese",
      image: "assets/images/products/sausage.png",
      weight: "200–250gr /pack",
      price: 17.50,
    ),
    ProductModel(
      title: "Strawberry premium all season",
      image: "assets/images/products/strawberry.png",
      weight: "85–90gr /pack",
      price: 11.25,
      oldPrice: 15.00,
      discount: 25,
    ),
    ProductModel(
      title: "Red watermelon fresh",
      image: "assets/images/products/watermelon.png",
      weight: "3–3.5kg /pack",
      price: 18.00,
      oldPrice: 20.00,
      discount: 10,
    ),
    ProductModel(
      title: "Salmon fish fillet fresh",
      image: "assets/images/products/salmon.png",
      weight: "180–200gr /pack",
      price: 65.00,
    ),
  ];

  List<ProductModel> get limitedDiscount =>
      todaysChoices.where((p) => p.discount != null).toList();

  List<ProductModel> get cheapest {
    final sorted = List<ProductModel>.from(todaysChoices);
    sorted.sort((a, b) => a.price.compareTo(b.price));
    return sorted;
  }

  List<ProductModel> get currentTabProducts {
    switch (selectedTabIndex) {
      case 1:
        return limitedDiscount;
      case 2:
        return cheapest;
      default:
        return todaysChoices;
    }
  }

  // ==========================================================
  // INSPIRATIONS
  // ==========================================================

  List<InspirationModel> inspirations = [
    InspirationModel(
      title: "Classic spaghetti bolognese",
      image: "assets/images/products/classic_spaghetti.png",
      time: "10 mins",
    ),
    InspirationModel(
      title: "Quick beef rice bowl",
      image: "assets/images/products/quick_beef_rice.png",
      time: "15 mins",
    ),
    InspirationModel(
      title: "Morning healthy salad",
      image: "assets/images/products/morning_salad.png",
      time: "5 mins",
    ),
  ];

  bool get showInspiration => isGrocery;

  // ==========================================================
  // NAVIGATION
  // ==========================================================

  void openCategory(int index) {
    selectedCategoryIndex = index;

    final mainController = Get.find<MainShellController>();
    mainController.changeTab(1);

    update();
  }

  // ==========================================================
// CATEGORIES
// ==========================================================

  List<CategoryModel> groceryCategories = [
    CategoryModel(title: "Vegetable", image: 'assets/images/icons/vegetable.png'),
    CategoryModel(title: "Fruit", image: 'assets/images/icons/fruits.png'),
    CategoryModel(title: "Meat", image: 'assets/images/icons/meat.png'),
    CategoryModel(title: "Seafood", image: 'assets/images/icons/seafood.png'),
    CategoryModel(title: "Protein", image: 'assets/images/icons/protine.png'),
  ];

  List<CategoryModel> medicineCategories = [
    CategoryModel(title: "Cold", image: 'assets/images/icons/medical/cold.png'),
    CategoryModel(title: "Fever", image: 'assets/images/icons/medical/fever.png'),
    CategoryModel(title: "Infection", image: 'assets/images/icons/medical/infection.png'),
    CategoryModel(title: "Diet", image: 'assets/images/icons/medical/diet.png'),
    CategoryModel(title: "Pregnancy", image: 'assets/images/icons/medical/pregnancy.png'),
  ];

  List<CategoryModel> get currentCategories =>
      isGrocery ? groceryCategories : medicineCategories;


// ==========================================================
// VENDORS
// ==========================================================

  List<VendorModel> groceryVendors = [
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
    VendorModel(
      name: "Green Harvest Store",
      subtitle: "4200 + Products",
      image: "assets/images/vendor3.png",
    ),
  ];

  List<VendorModel> medicineVendors = [
    VendorModel(
      name: "Wellness Medical, Mumbai",
      subtitle: "4000 + Products",
      image: "assets/images/medicine/pharmacy1.png",
    ),
    VendorModel(
      name: "24/7 Medical, Mumbai",
      subtitle: "1000 + Products",
      image: "assets/images/medicine/pharmacy2.png",
    ),
    VendorModel(
      name: "PharmaCare Store",
      subtitle: "2000 + Products",
      image: "assets/images/medicine/pharmacy3.png",
    ),
  ];

  List<VendorModel> get currentVendors =>
      isGrocery ? groceryVendors : medicineVendors;


// ==========================================================
// FLASH SECTION BACKGROUND
// ==========================================================

  Color get flashSectionBg =>
      isGrocery ? const Color(0xFFFFE7D6) : const Color(0xFFD9F5F7);
}