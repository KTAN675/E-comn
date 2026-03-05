import 'dart:ui';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../constant/app_colors.dart';

enum AppThemeMode {
  grocery,
  medicine,
}

class ThemeController extends GetxController {
  Color currentAccent = AppColors.primaryOrange;

  void changeAccent(Color newColor) {
    currentAccent = newColor;
    update();
  }

  AppThemeMode currentTheme = AppThemeMode.grocery;

  bool get isGrocery => currentTheme == AppThemeMode.grocery;

  void toggleTheme() {
    if (isGrocery) {
      currentTheme = AppThemeMode.medicine;
      AppColors.setMedicineTheme();
    } else {
      currentTheme = AppThemeMode.grocery;
      AppColors.setGroceryTheme();
    }

    update();
  }
}