import 'package:flutter/material.dart';

class AppColors {
  // ================= CORE BRAND =================

  static const Color primaryOrange = Color(0xFFCC0001 );
  static const Color secondaryCyan = Color(0xFF00C3D0);
  static const Color dangerRed = Color(0xFFFF0F0F);

  // ================= NEUTRALS =================

  static const Color background = Color(0xFFF4F4F4);
  static const Color white = Colors.white;
  static const Color black = Color(0xFF1E1E1E);
  static const Color greyText = Color(0xFF626262);
  static const Color border = Color(0xFFF1F1F1);

  // ================= LIGHT SHADES =================

  static const Color flashSale = Color(0xFFFFBE7A);
  static const Color lightCyan = Color(0xFFC7FBFF);

  // ================= DYNAMIC ACCENT =================
  // Default = Grocery Theme

  static Color accent = primaryOrange;
  static Color lightAccent = flashSale;

  // ================= THEME SWITCH =================

  static void setGroceryTheme() {
    accent = primaryOrange;
    lightAccent = flashSale;
  }

  static void setMedicineTheme() {
    accent = secondaryCyan;
    lightAccent = lightCyan;
  }
}