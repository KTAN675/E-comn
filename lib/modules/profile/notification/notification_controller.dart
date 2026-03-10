import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/app_colors.dart';
import '../../theme/theme_controller.dart';

class NotificationController extends GetxController {

  // =============================
  // STATE
  // =============================

  int selectedTabIndex = 0;

  // =============================
  // TAB CHANGE
  // =============================

  void changeTab(int index) {
    selectedTabIndex = index;
    update();
  }

  // =============================
  // DYNAMIC COLORS (synced with ThemeController)
  // =============================

  Color get accent => Get.find<ThemeController>().isGrocery
      ? AppColors.primaryOrange
      : AppColors.secondaryCyan;

  Color get cardBg => accent.withValues(alpha: 0.16);

  // =============================
  // MOCK DATA
  // =============================

  final List<Map<String, String>> orders = List.generate(
    4,
        (_) => {
      "title": "Flat 25% OFF on First Prescription Order!",
      "subtitle": "Use code FIRST25 at checkout. Valid till May 31.",
      "time": "12:34 AM",
      "date": "12 Aug 2024",
    },
  );

  // =============================
  // CURRENT LIST BASED ON TAB
  // =============================

  List<Map<String, String>> get currentList {
    if (selectedTabIndex == 0) return orders;
    return [];
  }
}
