import 'package:flutter/material.dart';

class FloatingNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  /// 🔥 Injected theme color
  final Color accent;

  const FloatingNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [

          /// 🔹 Background With Sliding Bump
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: selectedIndex.toDouble()),
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeInOut,
            builder: (context, value, child) {
              return CustomPaint(
                size: Size(MediaQuery.of(context).size.width, 80),
                painter: _NavPainter(
                  position: value,
                ),
              );
            },
          ),

          /// 🔹 Icons Row
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _navItem(Icons.home_rounded, 0),
                _navItem(Icons.grid_view_rounded, 1),
                const SizedBox(width: 70),
                _navItem(Icons.receipt_long_outlined, 3),
                _navItem(Icons.favorite_border, 4),
              ],
            ),
          ),

          /// 🔥 Center Floating Cart
          Positioned(
            bottom: 30,
            child: GestureDetector(
              onTap: () => onItemSelected(2),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 65,
                width: 65,
                decoration: BoxDecoration(
                  color: accent,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: accent.withOpacity(0.4),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.shopping_basket_outlined,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _navItem(IconData icon, int index) {
    final active = selectedIndex == index;

    return GestureDetector(
      onTap: () => onItemSelected(index),
      child: AnimatedScale(
        duration: const Duration(milliseconds: 200),
        scale: active ? 1.15 : 1,
        child: Icon(
          icon,
          size: 26,
          color: active ? accent : Colors.grey,
        ),
      ),
    );
  }
}

class _NavPainter extends CustomPainter {
  final double position;

  _NavPainter({required this.position});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.08)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 20);

    final width = size.width;
    final height = size.height;

    final itemWidth = width / 5;
    final centerX = itemWidth * position + itemWidth / 2;

    final path = Path();

    path.moveTo(20, 0);

    // Left curve
    path.quadraticBezierTo(0, 0, 0, 20);
    path.lineTo(0, height - 20);
    path.quadraticBezierTo(0, height, 20, height);

    path.lineTo(width - 20, height);
    path.quadraticBezierTo(width, height, width, height - 20);
    path.lineTo(width, 20);
    path.quadraticBezierTo(width, 0, width - 20, 0);

    // 🔥 Sliding bump
    path.moveTo(centerX - 30, 0);
    path.quadraticBezierTo(
      centerX,
      -20,
      centerX + 30,
      0,
    );

    canvas.drawPath(path, shadowPaint);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _NavPainter oldDelegate) {
    return oldDelegate.position != position;
  }
}