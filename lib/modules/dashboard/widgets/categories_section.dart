import 'package:flutter/material.dart';
import '../../../constant/app_colors.dart';
import '../../../constant/app_text_styles.dart';

class CategoryModel {
  final String title;
  final String image; // asset path for now, network later

  CategoryModel({
    required this.title,
    required this.image,
  });
}

class CategoriesSection extends StatelessWidget {
  final List<CategoryModel> categories;
  final int selectedIndex;
  final Function(int) onCategoryTap;
  final VoidCallback? onSeeAll;

  const CategoriesSection({
    super.key,
    required this.categories,
    required this.selectedIndex,
    required this.onCategoryTap,
    this.onSeeAll,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Categories",
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
                        color: AppColors.accent,
                        fontWeight: FontWeight.w500,
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

          const SizedBox(height: 14),

          /// Category List
          SizedBox(
            height: 92,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              separatorBuilder: (_, __) => const SizedBox(width: 18),
              itemBuilder: (context, index) {
                final category = categories[index];

                return GestureDetector(
                  onTap: () => onCategoryTap(index),
                  child: Column(
                    children: [

                      /// Image Container
                      Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          color: AppColors.lightAccent.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: Image.asset(
                            category.image,
                            width: 30,
                            height: 30,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),

                      const SizedBox(height: 6),

                      Text(
                        category.title,
                        style: AppTextStyles.body.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}