import 'dart:ui';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../constant/app_colors.dart';

class ThemeController extends GetxController {
  Color currentAccent = AppColors.primaryOrange;

  void changeAccent(Color newColor) {
    currentAccent = newColor;
    update();
  }
}