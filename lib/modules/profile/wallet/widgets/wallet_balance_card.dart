import 'package:flutter/material.dart';
import '../../../../constant/app_colors.dart';
import '../../../../constant/app_text_styles.dart';

class WalletBalanceCard extends StatelessWidget {
  final double balance;

  const WalletBalanceCard({
    super.key,
    required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 170,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.accent,
        borderRadius: BorderRadius.circular(19),
      ),
      child: Stack(
        children: [

          /// 🔥 BACKGROUND IMAGE
          Positioned(
            right: -10,
            bottom: -10,
            child: Opacity(
              opacity: .30,
              child: Image.asset(
                'assets/images/wallet/available_balance.png',
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

              Text(
                "Available Balance",
                style: AppTextStyles.h2.copyWith(
                  color: AppColors.white,
                ),
              ),

              Text(
                "₹${balance.toStringAsFixed(0)}",
                style: AppTextStyles.display.copyWith(
                  color: AppColors.white,
                ),
              ),

              Divider(
                color: AppColors.white.withValues(alpha: .4),
              ),

              Text(
                "Manage Your Balance With Ease. Add, Track, And Use It Anytime.",
                style: AppTextStyles.body.copyWith(
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}