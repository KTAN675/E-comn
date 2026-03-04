import 'package:flutter/material.dart';

import '../../dashboard/widgets/categories_section.dart';

class SubCategoryList extends StatelessWidget {
  final List<CategoryModel> categories;
  final int selectedIndex;
  final Function(int) onTap;
  final Color accent;
  final ScrollController controller;

  const SubCategoryList({
    super.key,
    required this.categories,
    required this.selectedIndex,
    required this.onTap,
    required this.accent,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        controller: controller,
        padding: const EdgeInsets.only(top: 8),
        itemCount: categories.length,
        itemBuilder: (context, index) {

          final category = categories[index];
          final selected = index == selectedIndex;

          return GestureDetector(
            onTap: () => onTap(index),
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 6,
              ),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: selected
                    ? accent.withValues(alpha: 0.15)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [

                  Image.asset(
                    category.image,
                    height: 40,
                  ),

                  const SizedBox(height: 6),

                  Text(
                    category.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: selected ? accent : Colors.black87,
                      fontWeight:
                      selected ? FontWeight.w600 : FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}