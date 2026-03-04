import 'package:e_comm/routes/app_pages.dart';
import 'package:e_comm/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'constant/app_theme.dart';
import 'modules/theme/theme_controller.dart';

void main() {
  Get.put(ThemeController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (controller) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme(controller.currentAccent),
          initialRoute: AppRoutes.splash,
          getPages: AppPages.pages,
        );
      },
    );
  }
}
