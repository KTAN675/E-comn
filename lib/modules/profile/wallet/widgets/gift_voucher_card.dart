import 'package:flutter/material.dart';
import '../../../../constant/app_colors.dart';

class GiftVoucherCard extends StatelessWidget {
  const GiftVoucherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 167,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFEDEDED),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          /// LEFT TEXT CONTENT
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [

                Text(
                  "Share Love Through E-Gift Vouchers !",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF333333),
                  ),
                  maxLines: 2,
                ),

                SizedBox(height: 6),

                Text(
                  "A Perfect Gift For Every Special Moment.",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF9EA0A5),
                  ),
                  maxLines: 2,
                ),

                SizedBox(height: 18),

                Text(
                  "Buy a Gift Voucher",
                  style: TextStyle(
                    color: AppColors.primaryOrange,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 10),

          /// RIGHT IMAGE
          Flexible(
            child: Image.asset(
              "assets/images/wallet/gift voucher.png",
              height: 90,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}