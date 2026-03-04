import 'package:flutter/material.dart';
import 'product_detail_info_block.dart';

class ProductDetailsContent extends StatelessWidget {

  const ProductDetailsContent({super.key});

  @override
  Widget build(BuildContext context) {

    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        ProductDetailInfoBlock(
          title: "Sourcing",
          description:
          "These ocnical heart-shape fruits are sourced from the finest indian farms",
        ),

        ProductDetailInfoBlock(
          title: "Storage",
          description:
          "Store in a cool, dry place away from direct sunlight. Refrigerate 30 min prior to usage for a good crispy taste.",
        ),

        ProductDetailInfoBlock(
          title: "Other Product Info",
          description:
          "EAN code : 1346884613\nsourced & market by innovative retail concepts private limited, Ranka junction 4th floor bangalore-3183",
        ),

        ProductDetailInfoBlock(
          title: "Vendor Details",
          description:
          "sold by Fresh Farm Traders, Mumbai - trusted seller known for quality grocery sourcing and timely delivery.",
        ),
      ],
    );
  }
}