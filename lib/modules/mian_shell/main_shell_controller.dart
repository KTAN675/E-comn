import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../constant/app_colors.dart';
import '../../data/models/product/product_model.dart';

class MainShellController extends GetxController {

  int currentIndex = 0;

  bool showNavBar = true;

  /// remember cart origin
  bool openedCartFromProduct = false;
  ProductModel? returnProduct;

  /// 🔹 change tab with optional navbar visibility
  void changeTab(int index, {bool? showNav}) {
    currentIndex = index;

    if (showNav != null) {
      showNavBar = showNav;
    }

    update();
  }

  /// 🔹 open cart normally
  void openCart() {
    openedCartFromProduct = false;
    returnProduct = null;

    changeTab(2, showNav: true);
  }

  /// 🔹 open cart from product
  void openCartFromProduct(ProductModel product) {
    openedCartFromProduct = true;
    returnProduct = product;

    changeTab(2, showNav: true);
  }

  void hideNavBar() {
    showNavBar = false;
    update();
  }

  void showNav() {
    showNavBar = true;
    update();
  }

  Color get accent => AppColors.accent;
}