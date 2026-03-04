import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/app_colors.dart';
import '../../constant/app_text_styles.dart';
import 'address_controller.dart';
import 'widgets/address_tile.dart';

class AddressView extends GetView<AddressController> {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        iconTheme: const IconThemeData(color: Colors.black),
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
                          color: AppColors.primaryOrange,
                        ),

                        const SizedBox(width: 6),

                        Text(
                          "Add Address",
                          style: AppTextStyles.bodyLarge.copyWith(
                            color: AppColors.primaryOrange,
                            fontWeight: FontWeight.w600,
                          ),
                        )
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
  }
}