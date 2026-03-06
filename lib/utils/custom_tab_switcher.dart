import 'package:flutter/material.dart';
import '../constant/app_text_styles.dart';

class CommonTabSwitcher extends StatelessWidget {
  final List<String> tabs;
  final int selectedIndex;
  final Function(int) onTabChanged;
  final Color accent;

  const CommonTabSwitcher({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    required this.onTabChanged,
    required this.accent,
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
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeInOut,
                    style: AppTextStyles.body.copyWith(
                      fontWeight:
                      isSelected ? FontWeight.w700 : FontWeight.w500,
                      color: isSelected
                          ? accent
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

        /// 🔹 Animated Indicator
        LayoutBuilder(
          builder: (context, constraints) {
            final tabWidth = constraints.maxWidth / tabs.length;

            return SizedBox(
              height: 12,
              width: double.infinity,
              child: TweenAnimationBuilder<double>(
                tween: Tween(
                  begin: 0,
                  end: selectedIndex.toDouble(),
                ),
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                builder: (context, animatedIndex, _) {
                  return CustomPaint(
                    painter: _WavePainter(
                      tabs: tabs,
                      animatedIndex: animatedIndex,
                      tabWidth: tabWidth,
                      textStyle: AppTextStyles.body.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                      accent: accent,
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}

class _WavePainter extends CustomPainter {
  final List<String> tabs;
  final double animatedIndex;
  final double tabWidth;
  final TextStyle textStyle;
  final Color accent;

  _WavePainter({
    required this.tabs,
    required this.animatedIndex,
    required this.tabWidth,
    required this.textStyle,
    required this.accent,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final baseLinePaint = Paint()
      ..color = Colors.grey.shade300
      ..strokeWidth = 1;

    final activePaint = Paint()
      ..color = accent
      ..style = PaintingStyle.fill;

    // Base grey line
    canvas.drawLine(
      Offset(0, size.height - 2),
      Offset(size.width, size.height - 2),
      baseLinePaint,
    );

    // Calculate center position dynamically
    final centerX =
        (animatedIndex * tabWidth) + tabWidth / 2;

    final int closestIndex = animatedIndex.round();

    // Measure text width of target tab
    final textPainter = TextPainter(
      text: TextSpan(
        text: tabs[closestIndex],
        style: textStyle,
      ),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();

    final textWidth = textPainter.width;

    final underlineLeft = centerX - textWidth / 2;
    final underlineTop = size.height - 3;

    // Underline
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

    // Pointer bump
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
    return oldDelegate.animatedIndex != animatedIndex ||
        oldDelegate.accent != accent;
  }
}