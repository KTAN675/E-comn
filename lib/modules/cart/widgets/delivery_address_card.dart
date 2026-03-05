import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant/app_colors.dart';
import '../../../constant/app_text_styles.dart';
import '../../../routes/app_routes.dart';
import '../cart_controller.dart';

class DeliveryAddressCard extends GetView<CartController> {
  const DeliveryAddressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (controller) {

        final address = controller.selectedAddress;

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(26),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// TITLE
              Text(
                "Delivery Address",
                style: AppTextStyles.bodyLarge.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 12),

              /// ADDRESS ROW
              InkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.mapLocation);
                  },
                child: Row(
                  children: [

                    /// LOCATION ICON
                    const Icon(
                      Icons.location_on_outlined,
                      size: 22,
                      color: Color(0xFF9E9E9E),
                    ),

                    const SizedBox(width: 10),

                    /// ADDRESS TEXT
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(
                            address.addressLine,
                            style: AppTextStyles.body.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          const SizedBox(height: 2),

                          Text(
                            address.city,
                            style: AppTextStyles.caption,
                          ),
                        ],
                      ),
                    ),

                    /// ARROW
                    const Icon(
                      Icons.chevron_right,
                      size: 28,
                      color: Color(0xFF9E9E9E),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}