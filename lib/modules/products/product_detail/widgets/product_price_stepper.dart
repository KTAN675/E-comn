import 'package:e_comm/constant/app_colors.dart';
import 'package:flutter/material.dart';
import '../../../../constant/app_text_styles.dart';

class ProductPriceStepper extends StatelessWidget {

  final double price;
  final double oldPrice;
  final int qty;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const ProductPriceStepper({
    super.key,
    required this.price,
    required this.oldPrice,
    required this.qty,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [

          Text(
            "\$ ${oldPrice.toStringAsFixed(2)}",
            style: AppTextStyles.strikePrice,
          ),

          const SizedBox(width: 10),

          Text(
            "\$ ${price.toStringAsFixed(2)}",
            style: AppTextStyles.price.copyWith(color: Colors.green),
          ),

          const Spacer(),

          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [

                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: onRemove,
                ),

                Text(qty.toString()),

                IconButton(
                  icon: const Icon(Icons.add),
                  color: AppColors.primaryOrange,
                  onPressed: onAdd,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}