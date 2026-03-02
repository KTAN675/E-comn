import 'package:flutter/material.dart';
import '../../../constant/app_text_styles.dart';

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

  /// 🔥 Injected Theme Colors
  final Color accent;
  final Color lightAccent;

  const VendorsSection({
    super.key,
    required this.vendors,
    required this.selectedIndex,
    required this.onVendorTap,
    required this.accent,
    required this.lightAccent,
    this.onSeeAll,
  });

  @override
  Widget build(BuildContext context) {
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
            height: 270,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: vendors.length,
              separatorBuilder: (_, __) => const SizedBox(width: 20),
              itemBuilder: (context, index) {
                final vendor = vendors[index];

                return _VendorCard(
                  vendor: vendor,
                  accent: accent,
                  onTap: () => onVendorTap(index),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _VendorCard extends StatefulWidget {
  final VendorModel vendor;
  final VoidCallback onTap;

  /// 🔥 Accent injected
  final Color accent;

  const _VendorCard({
    required this.vendor,
    required this.onTap,
    required this.accent,
  });

  @override
  State<_VendorCard> createState() => _VendorCardState();
}

class _VendorCardState extends State<_VendorCard> {
  bool showEffect = false;

  void _handleTap() async {
    setState(() => showEffect = true);

    await Future.delayed(const Duration(milliseconds: 120));

    setState(() => showEffect = false);

    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: AnimatedScale(
        duration: const Duration(milliseconds: 120),
        scale: showEffect ? 0.97 : 1,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 120),
          width: 190,
          decoration: BoxDecoration(
            color: const Color(0xFFEFEFEF),
            borderRadius: BorderRadius.circular(26),
            border: Border.all(
              color: showEffect
                  ? widget.accent
                  : Colors.transparent,
              width: 3,
            ),
            boxShadow: [
              if (showEffect)
                BoxShadow(
                  color: widget.accent.withValues(alpha: 0.35),
                  blurRadius: 22,
                  spreadRadius: 1,
                ),
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.10),
                blurRadius: 18,
                offset: const Offset(0, 14),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 16, horizontal: 14),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Image.asset(
                    widget.vendor.image,
                    height: 110,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 14),
                Expanded(
                  child: Column(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            widget.vendor.name,
                            textAlign: TextAlign.center,
                            style: AppTextStyles.bodyLarge.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            widget.vendor.subtitle,
                            style: AppTextStyles.bodyGrey.copyWith(
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "View Store",
                        style: AppTextStyles.body.copyWith(
                          color: widget.accent,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}