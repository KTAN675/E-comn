import 'dart:ui';

import 'package:flutter/cupertino.dart';

import '../../../utils/custom_tab_switcher.dart';

class VendorFilterTabs extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChanged;
  final Color accent;

  const VendorFilterTabs({
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
        tabs: const ["All Vendors", "Near by", "Available"],
        selectedIndex: selectedIndex,
        onTabChanged: onTabChanged,
        accent: accent,
      ),
    );
  }
}