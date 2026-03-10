import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/app_images.dart';
import '../../constant/app_text_styles.dart';
import '../../modules/theme/theme_controller.dart';
import '../../utils/app_primary_button.dart';
import 'location_permission_controller.dart';

class LocationPermissionView
    extends GetView<LocationPermissionController> {
  const LocationPermissionView({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final accent = Get.find<ThemeController>().currentAccent;

    return Scaffold(
      body: Stack(
        children: [
          /// SAME CURVED BACKGROUND
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/onboarding/onboarding_bg.png',
              height: h * 0.48,
              fit: BoxFit.cover,
            ),
          ),

          SafeArea(
            child: Column(
              children: [

                const SizedBox(height: 60),

                /// TITLE
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 36),
                  child: Text(
                    "We need access to location",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.h1.copyWith(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                /// DESCRIPTION
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 44),
                  child: Text(
                    "Your location helps us show nearby shops, offers and better rrealtime_userendations",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.body.copyWith(
                      color: const Color(0xff24252C),
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                /// IMAGE AREA (YOU WILL ADD YOUR IMAGE)
                Expanded(
                  child: Center(
                    child: Image.asset(
                      AppImages.locationIllustration, // add this in AppImages
                      fit: BoxFit.contain,
                    ),
                  ),
                ),


                /// BUTTON
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: AppPrimaryButton(
                      title: "Grant Access to Location",
                      onTap: controller.requestLocation,
                      enabled: true,
                    ),
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}