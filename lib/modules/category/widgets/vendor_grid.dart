import 'package:realtime_user/modules/category/widgets/vendor_card.dart';
import 'package:flutter/material.dart';

import '../../dashboard/widgets/vendor_section.dart';

class VendorGrid extends StatelessWidget {
  final List<VendorModel> vendors;
  final Function(VendorModel) onVendorTap;

  const VendorGrid({
    super.key,
    required this.vendors,
    required this.onVendorTap,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 100),
      itemCount: vendors.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 18,
        childAspectRatio: 0.78, // stable for vendor card
      ),
      itemBuilder: (context, index) {
        final vendor = vendors[index];

        return VendorCard(
          vendor: vendor,
          onTap: () => onVendorTap(vendor),
        );
      },
    );
  }
}