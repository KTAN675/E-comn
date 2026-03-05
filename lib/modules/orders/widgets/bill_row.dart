import 'package:flutter/material.dart';
import '../../../constant/app_text_styles.dart';

class BillRow extends StatelessWidget {

  final String title;
  final dynamic price;

  const BillRow({
    super.key,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [

          Text(
            title,
            style: AppTextStyles.bodyGrey,
          ),

          Text(
            "₹$price",
            style: AppTextStyles.bodyLarge,
          )
        ],
      ),
    );
  }
}