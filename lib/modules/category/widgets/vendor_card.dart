import 'package:flutter/material.dart';
import '../../../constant/app_text_styles.dart';
import '../../dashboard/widgets/vendor_section.dart';

class VendorCard extends StatelessWidget {
  final VendorModel vendor;
  final VoidCallback onTap;

  const VendorCard({
    super.key,
    required this.vendor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          /// Image adapts to grid cell
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.asset(
                vendor.image,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 10),

          /// Vendor Name
          Text(
            vendor.name,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.bodyLarge.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 4),

          /// Subtitle
          Text(
            vendor.subtitle,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.bodyGrey.copyWith(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}