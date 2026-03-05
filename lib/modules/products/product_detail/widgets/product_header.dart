import 'package:flutter/material.dart';

class ProductHeader extends StatelessWidget {

  final VoidCallback onBack;

  const ProductHeader({
    super.key,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [

          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: onBack,
          ),

          const Spacer(),

          const Icon(Icons.favorite_border),
        ],
      ),
    );
  }
}