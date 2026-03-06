import 'package:flutter/material.dart';
import '../../../constant/app_text_styles.dart';

class ReturnImageUpload extends StatelessWidget {
  const ReturnImageUpload({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          "Upload Image",
          style: AppTextStyles.bodyLarge,
        ),

        const SizedBox(height: 10),

        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}