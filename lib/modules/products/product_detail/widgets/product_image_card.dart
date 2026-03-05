import 'package:flutter/material.dart';

class ProductImageCard extends StatelessWidget {

  final String image;

  const ProductImageCard({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      clipBehavior: Clip.hardEdge,
      child: Image.asset(
        image,
        fit: BoxFit.cover,
      ),
    );
  }
}