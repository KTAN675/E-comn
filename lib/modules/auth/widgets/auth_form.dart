import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../../utils/app_primary_button.dart';
import '../../../utils/app_text_field.dart';
import '../base_auth_controller.dart';
import 'otp_action_text.dart';

class AuthForm extends StatelessWidget {
  final BaseAuthController controller;
  final String buttonText;

  const AuthForm({
    super.key,
    required this.controller,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller, // use the passed controller
      global: false,    // prevent global lookup
      builder: (_) {
        final c = controller;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "Phone number",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),

            const SizedBox(height: 10),

            AppTextField(
              controller: c.phoneController,
              hint: "9696969696",
              enabled: true,
              maxLength: 10,
            ),

            const SizedBox(height: 24),

            const Text(
              "OTP",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),

            const SizedBox(height: 10),

            AppTextField(
              controller: c.otpController,
              hint: "Enter OTP",
              enabled: c.otpSent,
              maxLength: 6,
              focusNode: c.otpFocus,
            ),

            const SizedBox(height: 12),

            Center(
              child: OtpActionText(controller: c),
            ),

            const SizedBox(height: 32),

            AppPrimaryButton(
              title: buttonText,
              onTap: c.verifyOtp,
              enabled: c.otpSent && !c.blocked,
            ),
          ],
        );
      },
    );
  }
}