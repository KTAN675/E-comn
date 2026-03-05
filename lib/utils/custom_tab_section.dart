import 'package:flutter/material.dart';
import '../constant/app_colors.dart';
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

    final accent = AppColors.accent;

    return Column(
      children: [

        /// 🔹 Tab Switcher (theme adaptive)
        CommonTabSwitcher(
          tabs: tabs,
          selectedIndex: selectedIndex,
          onTabChanged: onTabChanged,
          accent: accent,
        ),

        const SizedBox(height: 16),

        /// 🔥 Animated Tab Content (Slide Transition)
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) {

            final inFromRight = Tween<Offset>(
              begin: const Offset(0.15, 0),
              end: Offset.zero,
            ).animate(animation);

            final inFromLeft = Tween<Offset>(
              begin: const Offset(-0.15, 0),
              end: Offset.zero,
            ).animate(animation);

            return SlideTransition(
              position: selectedIndex == 0
                  ? inFromLeft
                  : inFromRight,
              child: FadeTransition(
                opacity: animation,
                child: child,
              ),
            );
          },
          child: Container(
            key: ValueKey<int>(selectedIndex),
            child: tabViews[selectedIndex],
          ),
        ),
      ],
    );
  }
}