import 'package:flutter/material.dart';
import '../../../../constant/app_colors.dart';

class GiftVoucherCard extends StatelessWidget {
  const GiftVoucherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 167,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0x33D9D9D9), // light grey with opacity
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          /// LEFT CONTENT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Share Love Through E-Gift Vouchers!",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "A Perfect Gift For Every Special Moment.",
                  style: TextStyle(
                    color: Color(0xFF97999D),
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  "Buy a Gift Voucher",
                  style: TextStyle(
                    color: AppColors.primaryOrange,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                  ),
                )
              ],
            ),
          ),

          const SizedBox(width: 12),

          /// RIGHT SIDE IMAGE
          Image.asset(
            'assets/images/wallet/gift voucher.png', // 👈 your asset path
            height: 90,
            width: 90,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 68.21,
                width: 62.61,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.primaryOrange,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.card_giftcard,
                  color: Colors.white,
                  size: 35,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}