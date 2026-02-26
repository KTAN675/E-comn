import 'package:e_comm/constant/app_colors.dart';
import 'package:e_comm/constant/app_radius.dart';
import 'package:e_comm/constant/app_text_styles.dart';
import 'package:e_comm/modules/theme/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    final accent = Get.find<ThemeController>().currentAccent;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: GetBuilder<AuthController>(
          builder: (c) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const SizedBox(height: 30),

                  Center(
                    child: Image.asset(
                      'assets/images/auth/logo.png',
                      height: 110,
                    ),
                  ),

                  const SizedBox(height: 30),

                  Text(
                    c.isSignup ? "Sign Up" : "Login",
                    style: AppTextStyles.h1,
                  ),

                  const SizedBox(height: 24),

                  Text("Phone number",
                      style: AppTextStyles.bodyLarge),

                  const SizedBox(height: 8),

                  TextField(
                    controller: c.phoneController,
                    maxLength: 10,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      counterText: "",
                      hintText: "9696969696",
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text("OTP",
                      style: AppTextStyles.bodyLarge),

                  const SizedBox(height: 8),

                  TextField(
                    controller: c.otpController,
                    focusNode: c.otpFocus,
                    enabled: c.otpSent,
                    maxLength: 6,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      counterText: "",
                      hintText: "Enter OTP",
                    ),
                  ),

                  const SizedBox(height: 8),

                  Center(
                    child: GestureDetector(
                      onTap: (c.seconds == 0 && !c.blocked)
                          ? c.sendOtp
                          : null,
                      child: Text(
                        !c.otpSent
                            ? "Send OTP"
                            : c.seconds > 0
                            ? "Resend OTP in 00:${c.seconds.toString().padLeft(2, '0')} sec"
                            : "Resend OTP",
                        style: AppTextStyles.body.copyWith(
                          color: (c.seconds == 0 && !c.blocked)
                              ? accent
                              : AppColors.greyText,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  if (c.blocked)
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: AppColors.dangerRed
                            .withValues(alpha: .08),
                        borderRadius:
                        BorderRadius.circular(AppRadius.medium),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.warning_rounded,
                              color: AppColors.dangerRed),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              "You've requested OTP too many times.\nPlease try again later",
                              style: AppTextStyles.error,
                            ),
                          ),
                        ],
                      ),
                    ),

                  const SizedBox(height: 28),

                  SizedBox(
                    width: double.infinity,
                    height: 58,
                    child: ElevatedButton(
                      onPressed: c.verifyOtp,
                      child: Text(
                        c.isSignup ? "Sign Up" : "Log in",
                        style: AppTextStyles.button,
                      ),
                    ),
                  ),

                  const SizedBox(height: 34),

                  Center(
                    child: GestureDetector(
                      onTap: c.toggleMode,
                      child: Text.rich(
                        TextSpan(
                          text: c.isSignup
                              ? "Already have an account? "
                              : "Don’t have an account? ",
                          style: AppTextStyles.bodyGrey,
                          children: [
                            TextSpan(
                              text: c.isSignup
                                  ? "Log in"
                                  : "Sign up",
                              style: AppTextStyles.bodyLarge
                                  .copyWith(
                                color: accent,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}