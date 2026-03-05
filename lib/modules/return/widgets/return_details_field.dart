import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../return_controller.dart';


class ReturnDetailsField extends GetView<ReturnController> {
  const ReturnDetailsField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const Text(
          "Additional Details",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),

        const SizedBox(height: 8),

        TextField(
          maxLines: 4,
          onChanged: (val) => controller.details.value = val,
          decoration: const InputDecoration(
            hintText: "Describe the issue or details.",
            border: OutlineInputBorder(),
          ),
        )
      ],
    );
  }
}