import 'package:flutter/cupertino.dart';

import 'custom_tab_switcher.dart';

class TabSection extends StatelessWidget {
  final List<String> tabs;
  final int selectedIndex;
  final Function(int) onTabChanged;
  final List<Widget> tabViews;

  const TabSection({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    required this.onTabChanged,
    required this.tabViews,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        CommonTabSwitcher(
          tabs: tabs,
          selectedIndex: selectedIndex,
          onTabChanged: onTabChanged,
        ),

        const SizedBox(height: 16),

        AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          child: tabViews[selectedIndex],
        ),
      ],
    );
  }
}