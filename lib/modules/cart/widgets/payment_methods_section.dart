import 'package:realtime_user/modules/cart/widgets/payment_methods_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant/app_colors.dart';
import '../cart_controller.dart';

class PaymentMethodSection extends GetView<CartController> {
  const PaymentMethodSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (controller) {

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            children: [

              /// 🔹 PAYMENT METHODS FROM CONTROLLER
              ...List.generate(
                controller.paymentMethods.length,
                    (index) {

                  final method = controller.paymentMethods[index];

                  return PaymentMethodTile(
                    title: method.title,
                    subtitle: method.subtitle,
                    icon: method.image, // 👈 comes from controller
                    selected: controller.selectedPaymentIndex == index,
                    onTap: () => controller.changePaymentMethod(index),
                  );
                },
              ),

              const SizedBox(height: 16),

              /// 🔹 ADD PAYMENT BUTTON
              Container(
                height: 52,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.primaryOrange,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Center(
                  child: Text(
                    "+ Add Payment Method",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}