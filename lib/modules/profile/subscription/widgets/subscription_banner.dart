import 'package:flutter/material.dart';

class SubscriptionBanner extends StatelessWidget {
  const SubscriptionBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120, // Adjust height as needed
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          image: AssetImage("assets/images/wallet/subscription.png"),
          fit: BoxFit.cover, // You can change to contain if needed
        ),
      ),
    );
  }
}