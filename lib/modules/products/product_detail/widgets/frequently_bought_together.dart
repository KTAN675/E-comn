import 'package:flutter/material.dart';
import '../../../../constant/app_text_styles.dart';
import '../../../../data/models/product/product_model.dart';

class FrequentlyBoughtTogether extends StatelessWidget {
  final List<ProductModel> products;
  final double totalPrice;
  final VoidCallback? onTap;

  const FrequentlyBoughtTogether({
    super.key,
    required this.products,
    required this.totalPrice,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// TITLE
          Text(
            "Frequently brought together",
            style: AppTextStyles.h3,
          ),

          const SizedBox(height: 16),

          /// PRODUCT ROW
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _buildProductRow(),
          ),

          const SizedBox(height: 16),

          /// BUY ALL ROW
          InkWell(
            onTap: onTap,
            child: Row(
              children: [

                Text(
                  "Buy all this  ₹${totalPrice.toInt()}",
                  style: AppTextStyles.bodyGrey.copyWith(
                    fontSize: 18,
                  ),
                ),

                const Spacer(),

                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 20,
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  List<Widget> _buildProductRow() {
    List<Widget> items = [];

    for (int i = 0; i < products.length; i++) {
      items.add(
        SizedBox(
          width: 70,
          height: 70,
          child: Image.asset(
            products[i].image,
            fit: BoxFit.contain,
          ),
        ),
      );

      if (i != products.length - 1) {
        items.add(
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Icon(Icons.add),
          ),
        );
      }
    }

    return items;
  }
}