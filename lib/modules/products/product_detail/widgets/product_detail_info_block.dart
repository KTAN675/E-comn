import 'package:flutter/material.dart';
import '../../../../constant/app_text_styles.dart';

class ProductDetailInfoBlock extends StatelessWidget {

  final String title;
  final String description;

  const ProductDetailInfoBlock({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            title,
            style: AppTextStyles.h3,
          ),

          const SizedBox(height: 6),

          Text(
            description,
            style: AppTextStyles.bodyGrey,
          ),
        ],
      ),
    );
  }
}