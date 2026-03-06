import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/app_colors.dart';
import '../../constant/app_text_styles.dart';

class DrawerControllerX extends GetxController {

  String userName = "Sam";
  String userRole = "Store Manager";
  String profileImage =
      "https://i.pravatar.cc/150?img=3";

  void goToOrders() {
    Get.back();
    Get.toNamed('/orders');
  }

  void askQuestion() {
    Get.back();
    Get.toNamed('/ask-question');
  }

  void openTerms() {
    Get.back();
    Get.toNamed('/openTerms');
  }

  void help_and_faqs() {
    Get.back();
    Get.toNamed('/help_and_faqs');
  }

  void openPrivacy() {
    Get.back();
    Get.toNamed('/privacy');
  }

  void openReturnPolicy() {
    Get.back();
    Get.toNamed('/return-policy');
  }

  void callUs() {
    Get.back();
  }

  void logout() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),

        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              /// ICON
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppColors.lightAccent,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.logout,
                  color: AppColors.primaryOrange,
                  size: 26,
                ),
              ),

              const SizedBox(height: 16),

              /// TITLE
              Text(
                "Log out?",
                style: AppTextStyles.h2,
              ),

              const SizedBox(height: 8),

              /// MESSAGE
              Text(
                "Are you sure you want to log out of your account?",
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyGrey,
              ),

              const SizedBox(height: 22),

              /// BUTTONS
              Row(
                children: [

                  /// CANCEL
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Get.back(),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        "Cancel",
                        style: AppTextStyles.buttonSecondary,
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  /// LOGOUT
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                        Get.offAllNamed('/login');
                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryOrange,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),

                      child: Text(
                        "Log out",
                        style: AppTextStyles.button,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}