import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../modules/theme/theme_controller.dart';

class AppPrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final bool enabled;
  final double height;
  final double fontSize;
  final FontWeight fontWeight;
  final EdgeInsetsGeometry padding;
  final IconData? icon; // 👈 add this

  const AppPrimaryButton({
    super.key,
    required this.title,
    required this.onTap,
    this.enabled = true,
    this.height = 58,
    this.fontSize = 18,
    this.fontWeight = FontWeight.w700,
    this.padding = const EdgeInsets.symmetric(horizontal: 12),
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final accent = Get.find<ThemeController>().currentAccent;

    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: enabled ? onTap : null,
        style: ElevatedButton.styleFrom(
          padding: padding,
          backgroundColor: accent,
          disabledBackgroundColor: const Color(0xffD6D6D6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: fontSize + 4, color: Colors.white),
              const SizedBox(width: 6),
            ],
            Text(
              title,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: fontWeight,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}