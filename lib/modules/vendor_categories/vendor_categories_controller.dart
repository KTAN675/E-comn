import 'dart:ui';
import 'package:get/get.dart';
import '../../constant/app_colors.dart';
import '../category/category_navigator.dart';
import '../../modules/dashboard/widgets/categories_section.dart';
import '../mian_shell/main_shell_controller.dart';
import '../theme/theme_controller.dart';

class VendorCategoriesController extends GetxController {

  /// 🔹 GLOBAL THEME
  final ThemeController theme = Get.find<ThemeController>();

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
  // DUMMY CATEGORY DATA
  // ==========================================================

  List<CategoryModel> groceryCategories = [
    CategoryModel(
        title: "Fruits",
        image: "assets/images/product_category/fruits.png"),
    CategoryModel(
        title: "Veggies",
        image: "assets/images/product_category/veggie.png"),
    CategoryModel(
        title: "Chicken, Meat & Fish",
        image: "assets/images/product_category/non_veg.png"),
    CategoryModel(
        title: "Masala, Oil & Dry Fruits",
        image: "assets/images/product_category/masala oil.png"),
    CategoryModel(
        title: "Dairy",
        image: "assets/images/product_category/dairy.png"),
    CategoryModel(
        title: "Beverages",
        image: "assets/images/product_category/beverages.png"),
    CategoryModel(
        title: "Snacks",
        image: "assets/images/product_category/snacks.png"),
    CategoryModel(
        title: "Breakfast",
        image: "assets/images/product_category/breakfast.png"),
    CategoryModel(
        title: "Tea & Coffee",
        image: "assets/images/product_category/tea_and_coffe.png"),
  ];

  List<CategoryModel> medicineCategories = [
    CategoryModel(title: "Cold", image: "assets/images/icons/medical/cold.png"),
    CategoryModel(title: "Fever", image: "assets/images/icons/medical/fever.png"),
    CategoryModel(title: "Infection", image: "assets/images/icons/medical/infection.png"),
    CategoryModel(title: "Diet", image: "assets/images/icons/medical/diet.png"),
    CategoryModel(title: "Pregnancy", image: "assets/images/icons/medical/pregnancy.png"),
    CategoryModel(title: "Heart", image: "assets/images/icons/medical/heart.png"),
    CategoryModel(title: "Diabetes", image: "assets/images/icons/medical/diabetes.png"),
    CategoryModel(title: "Tooth Pain", image: "assets/images/icons/medical/tooth.png"),
  ];

  List<CategoryModel> get currentCategories =>
      isGrocery ? groceryCategories : medicineCategories;

  // ==========================================================
  // NAVIGATION (NESTED)
  // ==========================================================

  void openCategory(CategoryModel category) {

    /// 🔹 Hide bottom navigation
    Get.find<MainShellController>().hideNavBar();

    /// 🔹 Navigate to product listing
    CategoryNavigator.navigatorKey.currentState?.pushNamed(
      '/product-listing',
      arguments: {
        "category": category,
        "isGrocery": isGrocery,
      },
    );
  }
}