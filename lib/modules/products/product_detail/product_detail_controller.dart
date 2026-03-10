import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant/app_colors.dart';
import '../../../data/models/product/product_model.dart';
import '../../../data/models/review/review_model.dart';
import '../../theme/theme_controller.dart';

class ProductDetailController extends GetxController {

  /// GLOBAL THEME
  final ThemeController theme = Get.find<ThemeController>();

  bool get isGrocery => theme.isGrocery;

  Color get accent => AppColors.accent;

  /// PRODUCT
  late ProductModel product;

  /// =============================
  /// TABS
  /// =============================

  int selectedTab = 1;

  void changeTab(int index) {
    selectedTab = index;
    update();
  }

  /// =============================
  /// QUANTITY
  /// =============================

  int quantity = 1;

  void increaseQty() {
    quantity++;
    update();
  }

  void decreaseQty() {
    if (quantity > 1) {
      quantity--;
      update();
    }
  }

  /// =============================
  /// QUESTION INPUT
  /// =============================

  final TextEditingController questionController =
  TextEditingController();

  void submitQuestion() {
    final question = questionController.text.trim();
    if (question.isEmpty) return;

    print("Question submitted: $question");

    questionController.clear();
  }

  @override
  void onClose() {
    questionController.dispose();
    super.onClose();
  }

  /// =============================
  /// BUNDLE PRODUCTS
  /// =============================

  final List<ProductModel> groceryBundleProducts = [
    ProductModel(
      title: "Cake Mix",
      image: "assets/images/products/cake.png",
      weight: "",
      price: 0,
    ),
    ProductModel(
      title: "Cookies",
      image: "assets/images/products/cookies.png",
      weight: "",
      price: 0,
    ),
    ProductModel(
      title: "Cream",
      image: "assets/images/products/cream.png",
      weight: "",
      price: 0,
    ),
  ];

  final List<ProductModel> medicineBundleProducts = [
    ProductModel(
      title: "Vitamin C",
      image: "assets/images/medicine/flu_relief.png",
      weight: "1 bottle",
      price: 120,
    ),
    ProductModel(
      title: "Cough Syrup",
      image: "assets/images/medicine/cold_relief.png",
      weight: "100ml",
      price: 85,
    ),
    ProductModel(
      title: "Thermometer",
      image: "assets/images/medicine/cough_dx.png",
      weight: "1 unit",
      price: 220,
    ),
  ];

  List<ProductModel> get bundleProducts =>
      isGrocery ? groceryBundleProducts : medicineBundleProducts;

  /// =============================
  /// REVIEWS
  /// =============================

  List<ReviewModel> reviews = [
    ReviewModel(
      id: "1",
      name: "Nupur Willington",
      avatar: "assets/images/profile.png",
      review: "This taste soo good, must try !",
      date: "July 2, 2026 • 03:21 PM",
      rating: 5,
      likes: 228,
      dislikes: 3,
      isLiked: false,
      isDisliked: false,
    ),
    ReviewModel(
      id: "2",
      name: "Ranjit Rao",
      avatar: "assets/images/profile.png",
      review: "Amazing quality and very fresh product.",
      date: "July 1, 2026 • 11:14 AM",
      rating: 4,
      likes: 148,
      dislikes: 2,
      isLiked: false,
      isDisliked: false,
    ),
    ReviewModel(
      id: "3",
      name: "Ananya Sharma",
      avatar: "assets/images/profile.png",
      review: "Good taste but packaging could be better.",
      date: "June 29, 2026 • 09:05 PM",
      rating: 4,
      likes: 89,
      dislikes: 5,
      isLiked: false,
      isDisliked: false,
    ),
  ];

  void toggleLike(int index) {
    final review = reviews[index];

    if (review.isLiked) {
      review.likes--;
      review.isLiked = false;
    } else {
      review.likes++;
      review.isLiked = true;

      if (review.isDisliked) {
        review.dislikes--;
        review.isDisliked = false;
      }
    }

    update();
  }

  void toggleDislike(int index) {
    final review = reviews[index];

    if (review.isDisliked) {
      review.dislikes--;
      review.isDisliked = false;
    } else {
      review.dislikes++;
      review.isDisliked = true;

      if (review.isLiked) {
        review.likes--;
        review.isLiked = false;
      }
    }

    update();
  }

  /// =============================
  /// Rrealtime_userENDED PRODUCTS
  /// =============================

  final List<ProductModel> groceryRrealtime_userendedProducts = [
    ProductModel(
      title: "Dragon Fruit",
      image: "assets/images/products/dragon.png",
      weight: "500-800g / Pack",
      price: 6.21,
      oldPrice: 9.00,
      discount: 15,
    ),
    ProductModel(
      title: "Banana",
      image: "assets/images/products/banana.png",
      weight: "500-800g / Pack",
      price: 6.21,
      oldPrice: 9.00,
      discount: 15,
    ),
    ProductModel(
      title: "Kiwi",
      image: "assets/images/products/kiwi.png",
      weight: "500-800g / Pack",
      price: 6.21,
      oldPrice: 9.00,
      discount: 15,
    ),
    ProductModel(
      title: "Grapes",
      image: "assets/images/products/grapes.png",
      weight: "500-800g / Pack",
      price: 6.21,
      oldPrice: 9.00,
      discount: 15,
    ),
  ];

  final List<ProductModel> medicineRrealtime_userendedProducts = [
    ProductModel(
      title: "Paracetamol",
      image: "assets/images/medicine/paracetamol.png",
      weight: "10 tablets",
      price: 40,
    ),
    ProductModel(
      title: "Pain Relief Spray",
      image: "assets/images/medicine/pain_spray.png",
      weight: "50ml",
      price: 160,
    ),
    ProductModel(
      title: "Multivitamin Tablets",
      image: "assets/images/medicine/multivitamin.png",
      weight: "30 tablets",
      price: 220,
    ),
  ];

  List<ProductModel> get rrealtime_userendedProducts =>
      isGrocery
          ? groceryRrealtime_userendedProducts
          : medicineRrealtime_userendedProducts;
}