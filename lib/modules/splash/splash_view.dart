  import 'package:flutter/material.dart';
  import 'package:get/get.dart';
  import 'splash_controller.dart';
  import '../../constant/app_images.dart';

  class SplashView extends StatelessWidget {
    const SplashView({super.key});

    @override
    Widget build(BuildContext context) {
      final SplashController controller = Get.find();

      return Scaffold(
        body: Image.asset(
          AppImages.splashLogo,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      );
    }
  }