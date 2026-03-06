import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant/app_text_styles.dart';
import '../exchange_controller.dart';

class ExchangeReasonDropdown extends StatelessWidget {
  const ExchangeReasonDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ExchangeController>();

    return GetBuilder<ExchangeController>(
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              "Exchange Reason",
              style: AppTextStyles.bodyLarge,
            ),

            const SizedBox(height: 10),

            GestureDetector(
              onTap: () {
                _openReasonSheet(controller);
              },

              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),

                decoration: BoxDecoration(
                  color: const Color(0xffF6F6F6),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.grey.shade300,
                  ),
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text(
                      controller.selectedReason ?? "Select Reason",
                      style: controller.selectedReason == null
                          ? AppTextStyles.bodyGrey
                          : AppTextStyles.body,
                    ),

                    const Icon(
                      Icons.keyboard_arrow_down_rounded,
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _openReasonSheet(ExchangeController controller) {
    Get.bottomSheet(

      Container(
        padding: const EdgeInsets.all(20),

        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            Text(
              "Select Exchange Reason",
              style: AppTextStyles.h3,
            ),

            const SizedBox(height: 20),

            ...controller.reasons.map((reason) {

              return ListTile(
                title: Text(reason),

                onTap: () {
                  controller.selectReason(reason);
                  Get.back();
                },
              );

            }).toList(),

            const SizedBox(height: 10),
          ],
        ),
      ),

      isScrollControlled: true,
    );
  }
}