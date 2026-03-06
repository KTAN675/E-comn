import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant/app_colors.dart';
import '../../../constant/app_text_styles.dart';
import '../cart_controller.dart';

class WalletSection extends GetView<CartController> {
  const WalletSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (controller) {

        final applied = controller.walletEnabled;
        final balance = controller.walletBalance;

        final saved = applied
            ? balance.clamp(0, controller.orderAmount)
            : 0;

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(26),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// TOP ROW
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// WALLET IMAGE
                  Image.asset(
                    "assets/images/payment/wallet.png",
                    width: 36,
                    height: 36,
                  ),

                  const SizedBox(width: 10),

                  /// TEXT
                  Expanded(
                    child: Text(
                      "Wallet Balance : ₹${balance.toStringAsFixed(0)}",
                      style: AppTextStyles.bodyLarge.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  const SizedBox(width: 8),

                  /// SAVED BADGE
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE7EFEA),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "You saved ₹$saved\nusing wallet !",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.caption.copyWith(
                        color: const Color(0xFF148A4F),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              /// APPLY WALLET
              GestureDetector(
                onTap: controller.toggleWallet,
                child: Row(
                  children: [

                    Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: applied
                            ? const Color(0xFF148A4F)
                            : Colors.grey.shade300,
                      ),
                      child: applied
                          ? const Icon(
                        Icons.check,
                        size: 18,
                        color: Colors.white,
                      )
                          : null,
                    ),

                    const SizedBox(width: 10),

                    Text(
                      "Apply Wallet",
                      style: AppTextStyles.bodyLarge,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 14),

              /// PROGRESS BAR
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: LinearProgressIndicator(
                  value: applied ? 0.55 : 0,
                  minHeight: 12,
                  backgroundColor: const Color(0xFFD9D9D9),
                  color: const Color(0xFF148A4F),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}