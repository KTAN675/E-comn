import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_comm/exchange/exchange_controller.dart';

class ExchangeDetailsField extends GetView<ExchangeController> {
  const ExchangeDetailsField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller.detailsController,
      maxLines: 5,
      decoration: InputDecoration(
        hintText: "Describe your issue",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}