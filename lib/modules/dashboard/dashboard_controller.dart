import 'dart:ui';

import 'package:e_comm/modules/dashboard/widgets/categories_section.dart';
import 'package:get/get.dart';
import '../../constant/app_colors.dart';
import '../../data/models/product/inspriation_model.dart';
import '../../data/models/product/product_model.dart';

enum DashboardTheme {
  grocery,
  medicine,
}

class DashboardController extends GetxController {

  // =============================
  // UI SELECTION STATES
  // =============================

  int selectedCategoryIndex = 0;
  int selectedVendorIndex = -1;
  int selectedTabIndex = 0;

  // =============================
  // THEME STATE
  // =============================

  DashboardTheme currentTheme = DashboardTheme.grocery;

  // =============================
  // LIFECYCLE
  // =============================

  @override
  void onInit() {
    super.onInit();
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
  // THEME TOGGLE
  // =============================

  void toggleTheme() {
    if (currentTheme == DashboardTheme.grocery) {
      currentTheme = DashboardTheme.medicine;
      AppColors.setMedicineTheme();
    } else {
      currentTheme = DashboardTheme.grocery;
      AppColors.setGroceryTheme();
    }
    update();
  }

  // =============================
  // BANNER IMAGE HELPER
  // =============================

  String get bannerImage =>
      currentTheme == DashboardTheme.grocery
          ? "assets/images/banner_grocery.png"
          : "assets/images/icons/medical.png";

  bool get isGrocery => currentTheme == DashboardTheme.grocery;

  // ==========================================================
  // PRODUCTS DATA
  // ==========================================================

  List<ProductModel> flashProducts = [
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

  List<ProductModel> todaysSpecials = [
    ProductModel(
      title: "Australia beef terderloin",
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
  // TAB PRODUCTS (Today's Choices Section)
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
  int bottomNavIndex = 0;

  void changeBottomNav(int index) {
    bottomNavIndex = index;
    update();
  }

// ==========================================================
// Categories
// ==========================================================

  List<CategoryModel> groceryCategories = [
    CategoryModel(title: "Vegetable", image: 'assets/images/icons/vegetable.png'),
    CategoryModel(title: "Fruit", image: 'assets/images/icons/fruits.png'),
    CategoryModel(title: "Meat", image: 'assets/images/icons/meat.png'),
    CategoryModel(title: "Seafood", image: 'assets/images/icons/seafood.png'),
    CategoryModel(title: "Protein", image: 'assets/images/icons/protine.png'),
  ];

  List<CategoryModel> medicineCategories = [
    CategoryModel(title: "Cold", image: 'assets/images/icons/cold.png'),
    CategoryModel(title: "Fever", image: 'assets/images/icons/fever.png'),
    CategoryModel(title: "Infection", image: 'assets/images/icons/infection.png'),
    CategoryModel(title: "Diet", image: 'assets/images/icons/diet.png'),
    CategoryModel(title: "Pregnancy", image: 'assets/images/icons/pregnancy.png'),
  ];
  List<CategoryModel> get currentCategories =>
      isGrocery ? groceryCategories : medicineCategories;

  // =============================
// THEME COLORS (COMPUTED)
// =============================

  Color get accent =>
      isGrocery ? AppColors.primaryOrange : AppColors.secondaryCyan;

  Color get lightAccent =>
      isGrocery ? AppColors.flashSale : AppColors.lightCyan;

  Color get flashSectionBg =>
      isGrocery ? const Color(0xFFFFE7D6) : const Color(0xFFD9F5F7);

}