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
    required this.onTabChanged,
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

        /// 🔹 Wave Indicator
        _TabIndicator(
          tabs: tabs,
          selectedIndex: selectedIndex,
        ),
      ],
    );
  }
}

class _TabIndicator extends StatelessWidget {
  final List<String> tabs;
  final int selectedIndex;

  const _TabIndicator({
    required this.tabs,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final tabWidth = constraints.maxWidth / tabs.length;

        return SizedBox(
          height: 12,
          width: double.infinity,
          child: CustomPaint(
            painter: _WavePainter(
              tabs: tabs,
              selectedIndex: selectedIndex,
              tabWidth: tabWidth,
              textStyle: AppTextStyles.body.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _WavePainter extends CustomPainter {
  final List<String> tabs;
  final int selectedIndex;
  final double tabWidth;
  final TextStyle textStyle;

  _WavePainter({
    required this.tabs,
    required this.selectedIndex,
    required this.tabWidth,
    required this.textStyle,
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

    // Measure selected text width
    final textPainter = TextPainter(
      text: TextSpan(
        text: tabs[selectedIndex],
        style: textStyle,
      ),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();

    final textWidth = textPainter.width;

    // Center of selected tab
    final tabStart = selectedIndex * tabWidth;
    final centerX = tabStart + tabWidth / 2;

    final underlineLeft = centerX - textWidth / 2;
    final underlineTop = size.height - 3;

    // Draw underline exactly matching text width
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          underlineLeft,
          underlineTop,
          textWidth,
          3,
        ),
        const Radius.circular(2),
      ),
      activePaint,
    );

    // Draw pointer bump centered on text
    const double pointerWidth = 45;
    const double pointerHeight = 8;

    final pointerLeft = centerX - pointerWidth / 2;

    final path = Path();
    path.moveTo(pointerLeft, underlineTop);
    path.quadraticBezierTo(
      centerX,
      underlineTop - pointerHeight,
      pointerLeft + pointerWidth,
      underlineTop,
    );
    path.close();

    canvas.drawPath(path, activePaint);
  }

  @override
  bool shouldRepaint(covariant _WavePainter oldDelegate) {
    return oldDelegate.selectedIndex != selectedIndex;
  }
}