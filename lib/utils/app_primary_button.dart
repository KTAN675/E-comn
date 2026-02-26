import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../modules/theme/theme_controller.dart';

class AppPrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final bool enabled;

  const AppPrimaryButton({
    super.key,
    required this.title,
    required this.onTap,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final accent = Get.find<ThemeController>().currentAccent;

    return SizedBox(
      width: double.infinity,
      height: 58,
      child: ElevatedButton(
        onPressed: enabled ? onTap : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: accent,
          disabledBackgroundColor: const Color(0xffD6D6D6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}