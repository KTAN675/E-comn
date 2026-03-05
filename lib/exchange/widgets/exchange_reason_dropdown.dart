import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../exchange_controller.dart';

class ExchangeReasonDropdown extends GetView<ExchangeController> {
  const ExchangeReasonDropdown({super.key});

  @override
  Widget build(BuildContext context) {

    return Obx(() =>
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
          ),

          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: controller.selectedReason.value,
              isExpanded: true,

              items: controller.reasons.map((e) {
                return DropdownMenuItem(
                  value: e,
                  child: Text(e),
                );
              }).toList(),

              onChanged: (value) {
                if (value != null) {
                  controller.changeReason(value);
                }
              },
            ),
          ),
        ));
  }
}