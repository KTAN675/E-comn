import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../modules/theme/theme_controller.dart';
import '../base_auth_controller.dart';

class OtpActionText extends StatelessWidget {
  final BaseAuthController controller;

  const OtpActionText({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final accent = Get.find<ThemeController>().currentAccent;

    if (!controller.otpSent) {
      return GestureDetector(
        onTap: controller.sendOtp,
        child: Text(
          "Send OTP",
          style: TextStyle(
            color: accent,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }

    if (controller.seconds > 0) {
      return RichText(
        text: TextSpan(
          style: const TextStyle(color: Color(0xff24252C)),
          children: [
            const TextSpan(text: "Resend OTP in "),
            TextSpan(
              text:
              "00:${controller.seconds.toString().padLeft(2, '0')} sec",
              style: const TextStyle(
                color: Color(0xffFF0F0F),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      );
    }

    return GestureDetector(
      onTap: controller.sendOtp,
      child: Text(
        "Resend OTP",
        style: TextStyle(
          color: accent,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}