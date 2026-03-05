import 'package:flutter/material.dart';
import '../../../utils/app_primary_button.dart';

class PlaceOrderSection extends StatelessWidget {
  final VoidCallback onTap;

  const PlaceOrderSection({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: AppPrimaryButton(
        title: "Place Order",
        onTap: onTap,
      ),
    );
  }
}