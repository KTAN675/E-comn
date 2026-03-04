import 'package:flutter/material.dart';

class WalletBalanceCard extends StatelessWidget {
  final double balance;

  const WalletBalanceCard({
    super.key,
    required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 357,
      height: 170,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Color(0xFFFF660E),
        borderRadius: BorderRadius.circular(19),
      ),
      child: Stack(
        children: [

          /// 🔥 RIGHT SIDE BACKGROUND IMAGE
          Positioned(
            right: -10,
            bottom: -10,
            child: Opacity(
              opacity: 0.30, // 👈 light background effect
              child: Image.asset(
                'assets/images/wallet/available_balance.png', // 👈 your image
                height: 100,
                fit: BoxFit.contain,
              ),
            ),
          ),

          /// 🔥 TEXT CONTENT
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Available Balance",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),

              Text(
                "₹${balance.toStringAsFixed(0)}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Divider(color: Colors.white.withOpacity(.4)),

              const Text(
                "Manage Your Balance With Ease. Add, Track, And Use It Anytime.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}