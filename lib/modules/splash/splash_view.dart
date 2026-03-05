  import 'package:flutter/material.dart';
  import 'package:get/get.dart';
  import '../../constant/app_colors.dart';
import 'splash_controller.dart';
  import '../../constant/app_images.dart';

  class SplashView extends StatelessWidget {
    const SplashView({super.key});

    @override
    Widget build(BuildContext context) {
      Get.find<SplashController>(); // ensure controller lifecycle starts

      return Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: AppColors.primaryOrange,
          child: Image.asset(
            AppImages.splashLogo,
            fit: BoxFit.contain, // PNG properly visible
          ),
        ),
      );
    }
  }