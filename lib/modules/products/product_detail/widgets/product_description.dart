import 'package:flutter/material.dart';
import '../../../../constant/app_text_styles.dart';

class ProductDescription extends StatelessWidget {

  final String description;

  const ProductDescription({
    super.key,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            "Descriptions",
            style: AppTextStyles.h3,
          ),

          const SizedBox(height: 8),

          Text(
            description,
            style: AppTextStyles.bodyGrey,
          ),
        ],
      ),
    );
  }
}