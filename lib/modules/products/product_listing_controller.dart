import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/app_colors.dart';
import '../../data/models/product/product_model.dart';
import '../dashboard/widgets/categories_section.dart';

class ProductListingController extends GetxController {
  int selectedSubIndex = 0;

  final ScrollController subCategoryScroll = ScrollController();

  void changeSubCategory(int index) {
    selectedSubIndex = index;

    _scrollToIndex(index);

    update();
  }

  void _scrollToIndex(int index) {
    const itemHeight = 90.0; // approximate height of each tile

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

  final bool isGrocery;

  ProductListingController({required this.isGrocery});

  Color get accent =>
      isGrocery ? AppColors.primaryOrange : AppColors.secondaryCyan;

  // =============================
  // SUB CATEGORIES (LEFT PANEL)
  // =============================

  // int selectedSubIndex = 0;

  final List<String> subCategories = [
    "Fruits",
    "Veggies",
    "Chicken,\nMeat & Fish",
    "Masala, Oil\n& Dry Fruits",
    "Dairy Prod",
    "Beverages",
  ];

  // void changeSubCategory(int index) {
  //   selectedSubIndex = index;
  //   update();
  // }

  // =============================
  // DUMMY PRODUCTS
  // =============================

  List<ProductModel> allProducts = [
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

  List<ProductModel> get currentProducts => allProducts;

  List<CategoryModel> subCategoriesModel = [
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
        title: "Dairy Prod",
        image: "assets/images/product_category/dairy.png"),
    CategoryModel(
        title: "Beverages",
        image: "assets/images/product_category/beverages.png"),
  ];
}