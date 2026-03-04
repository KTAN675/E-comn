import 'package:flutter/material.dart';
import '../../../modules/dashboard/widgets/categories_section.dart';
import 'category_card.dart';

class CategoryGrid extends StatelessWidget {
  final List<CategoryModel> categories;
  final Function(CategoryModel) onCategoryTap;

  const CategoryGrid({
    super.key,
    required this.categories,
    required this.onCategoryTap,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 100),
      itemCount: categories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 24,
        crossAxisSpacing: 16,
        childAspectRatio: 0.78,
      ),
      itemBuilder: (context, index) {
        final category = categories[index];

        return CategoryCard(
          category: category,
          onTap: () => onCategoryTap(category),
        );
      },
    );
  }
}