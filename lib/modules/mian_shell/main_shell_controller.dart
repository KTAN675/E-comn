import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../constant/app_colors.dart';

class MainShellController extends GetxController {

  int currentIndex = 0;

  bool showNavBar = true;

  void changeTab(int index) {
    currentIndex = index;
    showNavBar = true; // ensure nav appears when switching tabs
    update();
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