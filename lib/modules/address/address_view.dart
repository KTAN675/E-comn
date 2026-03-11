import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/app_colors.dart';
import '../../constant/app_text_styles.dart';
import '../theme/theme_controller.dart';
import 'address_controller.dart';
import 'widgets/address_tile.dart';

class AddressView extends GetView<AddressController> {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (theme) {

        final Color accent = theme.currentAccent; // ✅ Dynamic accent

        return Scaffold(
          backgroundColor: AppColors.white,

          appBar: AppBar(
            elevation: 0,
            backgroundColor: accent, // ✅ Dynamic
            iconTheme: const IconThemeData(color: Colors.white), // ✅
          ),

          body: GetBuilder<AddressController>(
            builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "My Addresses",
                      style: AppTextStyles.h2,
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// LIST
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.only(bottom: 20),
                      itemCount: controller.addresses.length,
                      itemBuilder: (context, index) {
                        return AddressTile(
                          address: controller.addresses[index],
                        );
                      },
                    ),
                  ),

                  /// ADD ADDRESS BUTTON (fixed at bottom)
                  SafeArea(
                    top: false,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 16,
                        bottom: 16,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed("/map-location");
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.add,
                              color: accent, // ✅ Dynamic
                            ),
                            const SizedBox(width: 6),
                            Text(
                              "Add Address",
                              style: AppTextStyles.bodyLarge.copyWith(
                                color: accent, // ✅ Dynamic
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}