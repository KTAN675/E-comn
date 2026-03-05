import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../return_controller.dart';


class ReturnReasonDropdown extends GetView<ReturnController> {
  const ReturnReasonDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const Text(
          "Return Reason",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),

        const SizedBox(height: 8),

        Obx(() {
          return DropdownButtonFormField<String>(
            value: controller.selectedReason.value.isEmpty
                ? null
                : controller.selectedReason.value,
            hint: const Text("Select Reason"),
            items: controller.reasons
                .map((e) => DropdownMenuItem(
              value: e,
              child: Text(e),
            ))
                .toList(),
            onChanged: (val) {
              controller.selectedReason.value = val ?? "";
            },
          );
        }),
      ],
    );
  }
}