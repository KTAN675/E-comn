import 'package:flutter/material.dart';
import '../../../utils/custom_tab_switcher.dart';

class CategoryFilterTabs extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChanged;
  final Color accent;

  const CategoryFilterTabs({
    super.key,
    required this.selectedIndex,
    required this.onTabChanged,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CommonTabSwitcher(
        tabs: const [
          "All Categories",
          "Quick Cook",
          "Healthy Life",
        ],
        selectedIndex: selectedIndex,
        onTabChanged: onTabChanged,
        accent: accent,
      ),
    );
  }
}