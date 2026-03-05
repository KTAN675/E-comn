import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/app_colors.dart';
import '../../data/models/product/product_model.dart';
import '../dashboard/widgets/categories_section.dart';

class ProductListingController extends GetxController {

  final bool isGrocery;

  ProductListingController({required this.isGrocery});

  int selectedSubIndex = 0;

  final ScrollController subCategoryScroll = ScrollController();

  void changeSubCategory(int index) {
    selectedSubIndex = index;
    _scrollToIndex(index);
    update();
  }

  void _scrollToIndex(int index) {
    const itemHeight = 90.0;

    final offset = (index * itemHeight) - 120;

    subCategoryScroll.animateTo(
      offset.clamp(
        0,
        subCategoryScroll.position.maxScrollExtent,
      ),
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
    );
  }

  @override
  void onClose() {
    subCategoryScroll.dispose();
    super.onClose();
  }

  // =============================
  // THEME
  // =============================

  Color get accent =>
      isGrocery ? AppColors.primaryOrange : AppColors.secondaryCyan;

  // =============================
  // SUB CATEGORIES
  // =============================

  final List<String> grocerySubCategories = [
    "Fruits",
    "Veggies",
    "Chicken,\nMeat & Fish",
    "Masala, Oil\n& Dry Fruits",
    "Dairy Prod",
    "Beverages",
  ];

  final List<String> medicineSubCategories = [
    "Cold",
    "Fever",
    "Infection",
    "Diet",
    "Pregnancy",
    "Heart",
  ];

  List<String> get subCategories =>
      isGrocery ? grocerySubCategories : medicineSubCategories;

  // =============================
  // SUB CATEGORY MODELS
  // =============================

  List<CategoryModel> grocerySubCategoriesModel = [
    CategoryModel(title: "Fruits", image: "assets/images/product_category/fruits.png"),
    CategoryModel(title: "Veggies", image: "assets/images/product_category/veggie.png"),
    CategoryModel(title: "Chicken, Meat & Fish", image: "assets/images/product_category/non_veg.png"),
    CategoryModel(title: "Masala, Oil & Dry Fruits", image: "assets/images/product_category/masala oil.png"),
    CategoryModel(title: "Dairy Prod", image: "assets/images/product_category/dairy.png"),
    CategoryModel(title: "Beverages", image: "assets/images/product_category/beverages.png"),
  ];

  List<CategoryModel> medicineSubCategoriesModel = [
    CategoryModel(title: "Cold", image: "assets/images/icons/medical/cold.png"),
    CategoryModel(title: "Fever", image: "assets/images/icons/medical/fever.png"),
    CategoryModel(title: "Infection", image: "assets/images/icons/medical/infection.png"),
    CategoryModel(title: "Diet", image: "assets/images/icons/medical/diet.png"),
    CategoryModel(title: "Pregnancy", image: "assets/images/icons/medical/pregnancy.png"),
    CategoryModel(title: "Heart", image: "assets/images/icons/medical/heart.png"),
  ];

  List<CategoryModel> get subCategoriesModel =>
      isGrocery ? grocerySubCategoriesModel : medicineSubCategoriesModel;

  // =============================
  // PRODUCTS
  // =============================

  List<ProductModel> groceryProducts = [
    ProductModel(
      title: "Strawberry",
      image: "assets/images/products/strawberry.png",
      weight: "150–200g /pack",
      price: 40.40,
      oldPrice: 50,
      discount: 10,
    ),
    ProductModel(
      title: "Banana",
      image: "assets/images/products/banana.png",
      weight: "100g /pack",
      price: 22.40,
      oldPrice: 32,
      discount: 12,
    ),
    ProductModel(
      title: "Dragon Fruit",
      image: "assets/images/products/dragon.png",
      weight: "150–200g /pack",
      price: 35.40,
      oldPrice: 50,
      discount: 15,
    ),
  ];

  List<ProductModel> medicineProducts = [
    ProductModel(
      title: "ColdRelief Plus",
      image: "assets/images/medicine/cold_relief.png",
      weight: "1 /pack",
      price: 95,
      oldPrice: 120,
      discount: 10,
    ),
    ProductModel(
      title: "ColdEa Capsules",
      image: "assets/images/medicine/cold_capsule.png",
      weight: "2 /pack",
      price: 165,
      oldPrice: 200,
      discount: 5,
    ),
    ProductModel(
      title: "FluRelief Max",
      image: "assets/images/medicine/flu_relief.png",
      weight: "3 /pack",
      price: 129,
      oldPrice: 150,
      discount: 30,
    ),
    ProductModel(
      title: "CoughCare DX",
      image: "assets/images/medicine/cough_dx.png",
      weight: "1 /pack",
      price: 99.40,
      oldPrice: 130,
      discount: 30,
    ),
  ];

  List<ProductModel> get allProducts =>
      isGrocery ? groceryProducts : medicineProducts;

  List<ProductModel> get currentProducts => allProducts;
}