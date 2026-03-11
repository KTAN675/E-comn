import 'package:flutter/material.dart';
import '../../../constant/app_colors.dart';
import '../../../constant/app_text_styles.dart';

class CategoryModel {
  final String title;
  final String image;

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
    this.onSeeAll, required List<CategoryModel> products,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// Header
          // Text(
          //   "Categories",
          //   style: AppTextStyles.h2.copyWith(
          //     fontWeight: FontWeight.w600,
          //   ),
          // ),

          // const SizedBox(height: 16),

          /// GRID
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: categories.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 16,
              mainAxisSpacing: 10,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) {

              final category = categories[index];

              return GestureDetector(
                onTap: () => onCategoryTap(index),
                child: Column(
                  children: [

                    /// CATEGORY CARD
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Center(
                        child: Image.asset(
                          category.image,
                          height: 50,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    /// TITLE
                    Text(
                      category.title,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.body.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
