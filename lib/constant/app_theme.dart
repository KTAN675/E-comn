import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';
import 'app_radius.dart';

class AppTheme {
  static ThemeData lightTheme(Color accentColor) {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.background,
      fontFamily: 'Poppins',

      // =======================
      // 🎨 PRIMARY COLOR
      // =======================
      primaryColor: accentColor,

      colorScheme: ColorScheme.light(
        primary: accentColor,
        secondary: accentColor,
        error: AppColors.dangerRed,
      ),

      // =======================
      // 🔘 ELEVATED BUTTON
      // =======================
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: accentColor,
          foregroundColor: AppColors.white,
          textStyle: AppTextStyles.button,
          shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(AppRadius.large),
          ),
          minimumSize: const Size(double.infinity, 50),
        ),
      ),

      // =======================
      // 📝 INPUT FIELD
      // =======================
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(AppRadius.large),
          borderSide: BorderSide(
            color: AppColors.border,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(AppRadius.large),
          borderSide: BorderSide(
            color: AppColors.border,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(AppRadius.large),
          borderSide: BorderSide(
            color: accentColor,
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(AppRadius.large),
          borderSide: BorderSide(
            color: AppColors.dangerRed,
          ),
        ),
      ),

      // =======================
      // 📱 APP BAR
      // =======================
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.background,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.black),
        titleTextStyle: AppTextStyles.h2,
      ),

      // =======================
      // 🔽 BOTTOM NAV
      // =======================
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.white,
        selectedItemColor: accentColor,
        unselectedItemColor: AppColors.greyText,
        selectedLabelStyle: AppTextStyles.caption,
        unselectedLabelStyle: AppTextStyles.caption,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}