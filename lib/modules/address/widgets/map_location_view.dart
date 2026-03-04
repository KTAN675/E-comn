import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant/app_colors.dart';
import '../../../constant/app_text_styles.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/app_primary_button.dart';

class MapLocationView extends StatelessWidget {
  const MapLocationView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.white,

      body: Stack(
        children: [

          /// MAP PLACEHOLDER
          Positioned.fill(
            child: Image.asset(
              "assets/images/map_placeholder.png",
              fit: BoxFit.fitHeight,
            ),
          ),

          /// BACK BUTTON
          SafeArea(
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Get.back(),
            ),
          ),

          /// BOTTOM CARD
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(28),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),

              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// TITLE
                  Text(
                    "Select Your Location",
                    style: AppTextStyles.bodyLarge.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const SizedBox(height: 16),

                  /// SUBTITLE
                  Text(
                    "Your Current Location",
                    style: AppTextStyles.bodyGrey,
                  ),

                  const SizedBox(height: 10),

                  /// LOCATION ROW
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      /// CHECK ICON
                      const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 22,
                      ),

                      const SizedBox(width: 8),

                      /// ADDRESS TEXT
                      Expanded(
                        child: Text(
                          "cecilla road 7103-426 Nutsia Austria",
                          style: AppTextStyles.body,
                        ),
                      ),

                      /// CHANGE BUTTON
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.address);
                        },
                        child: Text(
                          "Change",
                          style: AppTextStyles.body.copyWith(
                            color: Colors.green,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 22),

                  /// CONFIRM BUTTON
                  AppPrimaryButton(
                    title: "Confirm Location & Proceed",
                    onTap: () {
                      Get.back();
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}