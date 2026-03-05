import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../constant/app_colors.dart';
import '../../theme/theme_controller.dart';

class FloatingNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const FloatingNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  static const double _height = 70;
  static const double _circleSize = 60;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (_) {

        final accent = AppColors.accent;

        final width = MediaQuery.of(context).size.width;
        final navWidth = width - 32;
        final itemWidth = navWidth / 5;

        return SizedBox(
          height: _height + 60,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [

              /// Floating Capsule
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

              /// Sliding Pointer
              AnimatedPositioned(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                bottom: 15,
                left: (width - navWidth) / 2 +
                    (itemWidth * selectedIndex) +
                    (itemWidth / 2) -
                    (31 / 2),
                child: _Pointer(color: accent),
              ),

              /// Icons
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
                              child: SvgPicture.asset(
                                _getIcon(index),
                                width: 28,
                                height: 28,
                                colorFilter: ColorFilter.mode(
                                  isSelected ? accent : AppColors.greyText,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),

              /// Center Cart Button
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
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/images/icons/cart.svg",
                        width: 24,
                        height: 24,
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _getIcon(int index) {
    switch (index) {
      case 0:
        return "assets/images/icons/home.svg";
      case 1:
        return "assets/images/icons/category.svg";
      case 3:
        return "assets/images/icons/orders.svg";
      case 4:
        return "assets/images/icons/wishlist.svg";
      default:
        return "assets/images/icons/home.svg";
    }
  }
}

class _Pointer extends StatelessWidget {
  final Color color;

  const _Pointer({required this.color});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(36, 14),
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

    path.moveTo(0, size.height);

    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.2,
      size.width / 2,
      0,
    );

    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.2,
      size.width,
      size.height,
    );

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}