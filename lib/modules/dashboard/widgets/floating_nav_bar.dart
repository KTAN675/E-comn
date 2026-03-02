import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../constant/app_colors.dart';

class FloatingNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;
  final Color accent;

  const FloatingNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
    required this.accent,
  });

  static const double _height = 70;
  static const double _circleSize = 60;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final navWidth = width - 32;
    final itemWidth = navWidth / 5;

    return SizedBox(
      height: _height + 60,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [

          /// 🔹 Floating Capsule (lighter like UI)
          Positioned(
            bottom: 14,
            child: Container(
              width: navWidth,
              height: _height,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.92),
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.12),
                    blurRadius: 35,
                    offset: const Offset(0, 18),
                  ),
                ],
              ),
            ),
          ),

          /// 🔹 Sliding Pointer (wider + flatter)
          AnimatedPositioned(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            bottom: 15,
            left: (width - navWidth) / 2 +          // Container left padding
                (itemWidth * selectedIndex) +     // Icon slot
                (itemWidth / 2) - (31 / 2),      // Center 25px pointer in  slot
            child: _Pointer(color: accent),  // Pass width if dynamic
          ),

          /// 🔹 Icons
          Positioned(
            bottom: 14,
            child: SizedBox(
              width: navWidth,
              height: _height,
              child: Row(
                children: List.generate(5, (index) {
                  if (index == 2) {
                    return const SizedBox(width: _circleSize);
                  }

                  final isSelected = selectedIndex == index;

                  return Expanded(
                    child: GestureDetector(
                      onTap: () => onItemSelected(index),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Icon(
                            _getIcon(index),
                            size: 26,
                            color: isSelected ? accent : AppColors.greyText,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          /// 🔹 Center Button
          Positioned(
            bottom: 36,
            child: GestureDetector(
              onTap: () => onItemSelected(2),
              child: Container(
                width: _circleSize,
                height: _circleSize,
                decoration: BoxDecoration(
                  color: accent,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: accent.withValues(alpha: 0.5),
                      blurRadius: 25,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.shopping_basket_outlined,
                  color: Colors.white,
                  size: 26,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  IconData _getIcon(int index) {
    switch (index) {
      case 0:
        return Icons.home_rounded;
      case 1:
        return Icons.grid_view_rounded;
      case 3:
        return Icons.receipt_long_rounded;
      case 4:
        return Icons.favorite_border_rounded;
      default:
        return Icons.home;
    }
  }
}

class _Pointer extends StatelessWidget {
  final Color color;

  const _Pointer({required this.color});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(36, 14), // wider + shorter
      painter: _PointerPainter(color),
    );
  }
}

class _PointerPainter extends CustomPainter {
  final Color color;

  _PointerPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();

    // Start bottom left
    path.moveTo(0, size.height);

    // Curve up to peak (left side)
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.2,
      size.width / 2,
      0,
    );

    // Curve down from peak (right side)
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.2,
      size.width,
      size.height,
    );

    // Close bottom
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}