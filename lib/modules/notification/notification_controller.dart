import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/app_colors.dart';

class NotificationController extends GetxController {

  // =============================
  // STATE
  // =============================

  int selectedTabIndex = 0;
  bool isGrocery = true;

  // =============================
  // TAB CHANGE
  // =============================

  void changeTab(int index) {
    selectedTabIndex = index;
    update();
  }

  // =============================
  // THEME TOGGLE
  // =============================

  void toggleTheme() {
    isGrocery = !isGrocery;

    // 🔥 Sync with AppColors theme system
    if (isGrocery) {
      AppColors.setGroceryTheme();
    } else {
      AppColors.setMedicineTheme();
    }

    update();
  }

  // =============================
  // DYNAMIC COLORS (NO HARDCODE)
  // =============================

  /// Accent color (comes from AppColors system)
  Color get accent => AppColors.accent;

  /// Light background tone (from theme system)
  Color get cardBg => AppColors.lightAccent.withValues(alpha: 0.16);

  // =============================
  // MOCK DATA
  // =============================

  final List<Map<String, String>> orders = List.generate(
    4,
        (_) => {
      "title": "Flat 25% OFF on First Prescription Order!",
      "subtitle":
      "Use code FIRST25 at checkout. Valid till May 31.",
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