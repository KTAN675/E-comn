import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant/app_colors.dart';
import '../../../constant/app_text_styles.dart';
import '../../../routes/app_routes.dart';

class VendorModel {
  final String name;
  final String subtitle;
  final String image;

  VendorModel({
    required this.name,
    required this.subtitle,
    required this.image,
  });
}

class VendorsSection extends StatelessWidget {
  final List<VendorModel> vendors;
  final int selectedIndex;
  final Function(int) onVendorTap;
  final VoidCallback? onSeeAll;

  const VendorsSection({
    super.key,
    required this.vendors,
    required this.selectedIndex,
    required this.onVendorTap,
    this.onSeeAll,
  });

  @override
  Widget build(BuildContext context) {
    final accent = AppColors.accent;
    final lightAccent = AppColors.lightAccent;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// 🔹 Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Top vendors around you",
                style: AppTextStyles.h2.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              GestureDetector(
                onTap: onSeeAll,
                child: Row(
                  children: [
                    Text(
                      "See all",
                      style: AppTextStyles.body.copyWith(
                        color: accent,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: accent,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 14),

        /// 🔹 Accent Strip Background
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          color: lightAccent.withValues(alpha: 0.16),
          child: SizedBox(
            height: 240,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: vendors.length,
              separatorBuilder: (_, __) => const SizedBox(width: 20),
              itemBuilder: (context, index) {
                final vendor = vendors[index];
                return _VendorCard(vendor: vendor);
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _VendorCard extends StatelessWidget {
  final VendorModel vendor;

  const _VendorCard({required this.vendor});

  @override
  Widget build(BuildContext context) {
    final accent = AppColors.accent;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 120),
      width: 155,
      decoration: BoxDecoration(
        color: const Color(0xFFEFEFEF),
        borderRadius: BorderRadius.circular(26),
        border: Border.all(
          color: Colors.transparent,
          width: 3,
        ),
        boxShadow: const [], // ✅ shadow removed
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.asset(
                vendor.image,
                height: 110,
                width: double.infinity,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 14),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        vendor.name,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.bodyLarge.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        vendor.subtitle,
                        style: AppTextStyles.bodyGrey.copyWith(fontSize: 13),
                      ),
                    ],
                  ),

                  /// ✅ Only this navigates to next page
                  GestureDetector(
                    onTap: () => Get.toNamed(AppRoutes.vendorCategories),
                    child: Text(
                      "View Store",
                      style: AppTextStyles.body.copyWith(
                        color: accent,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}