import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant/app_colors.dart';
import '../../../constant/app_text_styles.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/app_primary_button.dart';

class OrderSuccessDialog extends StatelessWidget {

  final String invoiceId;
  final String image;

  const OrderSuccessDialog({
    super.key,
    required this.invoiceId,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 26,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(28),
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            /// SUCCESS IMAGE
            Image.asset(
              image,
              height: 90,
            ),

            const SizedBox(height: 22),

            /// TITLE
            Text(
              "Thankyou for shopping",
              style: AppTextStyles.h2,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 12),

            /// DESCRIPTION
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: AppTextStyles.bodyGrey,
                children: [

                  const TextSpan(
                    text:
                    "Your Order will be delivered with invoice ",
                  ),

                  TextSpan(
                    text: "#$invoiceId",
                    style: AppTextStyles.bodyGrey.copyWith(
                      color: AppColors.primaryOrange,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const TextSpan(
                    text:
                    ". You can track the delivery in the order section.",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 26),

            /// GO BUTTON
            AppPrimaryButton(
              title: "Go to Orders",
              onTap: () {

                Get.back(); // close popup

                Future.delayed(const Duration(milliseconds: 200), () {
                  Get.toNamed(AppRoutes.orders);
                });

              },
            )
          ],
        ),
      ),
    );
  }
}