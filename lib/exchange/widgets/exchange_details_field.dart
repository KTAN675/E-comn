import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '..//exchange_controller.dart';

class ExchangeDetailsField extends GetView<ExchangeController> {
  const ExchangeDetailsField({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 140,
      padding: const EdgeInsets.symmetric(horizontal: 12),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),

      child: TextField(
        controller: controller.detailsController,
        maxLines: 5,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: "Describe the issue or details.",
        ),
      ),
    );
  }
}