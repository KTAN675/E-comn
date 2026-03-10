
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realtime_user/modules/return/widgets/return_additional_details.dart';
import 'package:realtime_user/modules/return/widgets/return_image_upload.dart';
import 'package:realtime_user/modules/return/widgets/return_reason_dropdown.dart';
import '../../constant/app_colors.dart';
import '../../utils/app_primary_button.dart';
import 'return_controller.dart';

class ReturnView extends GetView<ReturnController> {
  const ReturnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text("Request Return"),
      ),

      body: GetBuilder<ReturnController>(
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(16),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const ReturnReasonDropdown(),

                const SizedBox(height: 20),

                const ReturnImageUpload(),

                const SizedBox(height: 20),

                const ReturnAdditionalDetails(),

                const Spacer(),

                AppPrimaryButton(
                  title: "Confirm Return",
                  enabled: controller.selectedReason != null,
                  onTap: controller.confirmReturn,
                )
              ],
            )
          );
        },
      ),
    );
  }
}