import 'package:flutter/material.dart';
import '../constant/app_colors.dart';
import '../constant/app_text_styles.dart';

class CommonTabSwitcher extends StatelessWidget {
  final List<String> tabs;
  final int selectedIndex;
  final Function(int) onTabChanged;

  const CommonTabSwitcher({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    required this.onTabChanged, required accent,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        /// 🔹 Tabs Row
        Row(
          children: List.generate(tabs.length, (index) {
            final isSelected = index == selectedIndex;

            return Expanded(
              child: GestureDetector(
                onTap: () => onTabChanged(index),
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    style: AppTextStyles.body.copyWith(
                      fontWeight:
                      isSelected ? FontWeight.w700 : FontWeight.w500,
                      color: isSelected
                          ? AppColors.primaryOrange
                          : Colors.grey.shade500,
                    ),
                    child: Center(
                      child: Text(tabs[index]),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),

        const SizedBox(height: 6),

        /// 🔹 Wave Indicator
        _TabIndicator(
          selectedIndex: selectedIndex,
          totalTabs: tabs.length,
        ),
      ],
    );
  }
}

class _TabIndicator extends StatelessWidget {
  final int selectedIndex;
  final int totalTabs;

  const _TabIndicator({
    required this.selectedIndex,
    required this.totalTabs,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final tabWidth = constraints.maxWidth / totalTabs;

        return TweenAnimationBuilder<double>(
          tween: Tween(
            begin: selectedIndex * tabWidth,
            end: selectedIndex * tabWidth,
          ),
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          builder: (context, value, child) {
            return SizedBox(
              height: 24,
              width: double.infinity,
              child: CustomPaint(
                painter: _WavePainter(
                  indicatorStart: selectedIndex * tabWidth,
                  tabWidth: tabWidth,
                ),
              ),
            );
          },
        );
      },
    );
  }
}


class _WavePainter extends CustomPainter {
  final double indicatorStart;
  final double tabWidth;

  _WavePainter({
    required this.indicatorStart,
    required this.tabWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final baseLinePaint = Paint()
      ..color = Colors.grey.shade300
      ..strokeWidth = 1;

    final activePaint = Paint()
      ..color = AppColors.primaryOrange
      ..style = PaintingStyle.fill;

    // Base grey line
    canvas.drawLine(
      Offset(0, size.height - 2),
      Offset(size.width, size.height - 2),
      baseLinePaint,
    );

    final startX = indicatorStart + tabWidth * 0.05;
    final endX = indicatorStart + tabWidth * 0.95;
    final centerX = (startX + endX) / 2;

    final path = Path();

    // Start from left
    path.moveTo(startX, size.height - 2);

    // Very subtle wide curve
    path.quadraticBezierTo(
      centerX,
      size.height - 10, // LOWER curve height
      endX,
      size.height - 2,
    );

    // Close bottom
    path.lineTo(endX, size.height);
    path.lineTo(startX, size.height);
    path.close();

    canvas.drawPath(path, activePaint);

    // Thin underline
    canvas.drawRect(
      Rect.fromLTWH(
        startX,
        size.height - 3,
        endX - startX,
        2,
      ),
      activePaint,
    );
  }

  @override
  bool shouldRepaint(covariant _WavePainter oldDelegate) {
    return oldDelegate.indicatorStart != indicatorStart;
  }
}