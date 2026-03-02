
import 'package:flutter/material.dart';

import '../../../constant/app_colors.dart';
import '../../../constant/app_text_styles.dart';
import '../../../data/models/product/inspriation_model.dart';
import '../../products/widgets/inspiration_card.dart';

class InspirationSection extends StatelessWidget {
  final List<InspirationModel> items;
  final VoidCallback? onSeeAll;

  const InspirationSection({
    super.key,
    required this.items,
    this.onSeeAll,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Your Daily Inspiration",
                style: AppTextStyles.h2.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              GestureDetector(
                onTap: onSeeAll,
                child: Row(
                  children: [
                    Text(
                      "See all",
                      style: AppTextStyles.body.copyWith(
                        color: AppColors.accent,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: AppColors.accent,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        SizedBox(
          height: 140,
          child: ListView.separated(
            padding:
            const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            separatorBuilder: (_, __) =>
            const SizedBox(width: 18),
            itemBuilder: (context, index) {
              return InspirationCard(
                item: items[index],
              );
            },
          ),
        ),
      ],
    );
  }
}