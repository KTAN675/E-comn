import 'package:flutter/material.dart';
import '../../../constant/app_text_styles.dart';
import '../../../constant/app_colors.dart';
import '../../../data/models/address/address_model.dart';

class AddressTile extends StatelessWidget {
  final AddressModel address;

  const AddressTile({
    super.key,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Column(
        children: [

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      address.title,
                      style: AppTextStyles.bodyLarge.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      address.building,
                      style: AppTextStyles.bodyGrey,
                    ),

                    Text(
                      "${address.addressLine}, ${address.city}",
                      style: AppTextStyles.bodyGrey,
                    ),
                  ],
                ),
              ),

              const Icon(Icons.more_vert),
            ],
          ),

          const SizedBox(height: 16),

          const Divider(color: AppColors.border)
        ],
      ),
    );
  }
}