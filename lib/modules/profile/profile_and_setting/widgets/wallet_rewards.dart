import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constant/app_colors.dart';
import '../../../../constant/app_text_styles.dart';
import '../../../../routes/app_routes.dart';
import '../profile_and_setting_controller.dart';

class WalletRewardsRow extends StatelessWidget {
  final ProfileAndSettingController ctrl;

  const WalletRewardsRow({
    super.key,
    required this.ctrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          /// =======================
          /// Wallet Money Card
          /// =======================
          Expanded(
            child: GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.wallet);
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/wallet/Wallet.png',
                      width: 28,
                      height: 28,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.account_balance_wallet_outlined,
                          size: 28,
                          color: Colors.orange,
                        );
                      },
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Wallet Money',
                            style: AppTextStyles.caption.copyWith(
                              color: Colors.grey[700],
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '₹${ctrl.walletBalance}',
                            style: AppTextStyles.h3.copyWith(
                              color: AppColors.primaryOrange,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(width: 12),

          /// =======================
          /// Rewards Card
          /// =======================
          Expanded(
            child: GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.rewards);
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/wallet/Yellow Five Pointed Star.png',
                      width: 28,
                      height: 28,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.star,
                          size: 28,
                          color: Colors.orange,
                        );
                      },
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Rewards',
                            style: AppTextStyles.caption.copyWith(
                              color: Colors.grey[700],
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${ctrl.rewardsCount} new',
                            style: AppTextStyles.h3.copyWith(
                              color: AppColors.primaryOrange,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}