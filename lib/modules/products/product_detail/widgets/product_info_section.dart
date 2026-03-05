import 'package:flutter/material.dart';
import '../../../../constant/app_text_styles.dart';

class ProductInfoSection extends StatelessWidget {

  final String title;
  final String shop;

  const ProductInfoSection({
    super.key,
    required this.title,
    required this.shop,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            title,
            style: AppTextStyles.h2,
          ),

          const SizedBox(height: 4),

          Text(
            shop,
            style: AppTextStyles.bodyGrey,
          ),
        ],
      ),
    );
  }
}