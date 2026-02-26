import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';
import '../widgets/auth_form.dart';
import '../widgets/auth_header.dart';
import '../widgets/social_login_row.dart';
import 'sign_up_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F4F4),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              keyboardDismissBehavior:
              ScrollViewKeyboardDismissBehavior.onDrag,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [

                        const SizedBox(height: 30),

                        const AuthHeader(title: "Sign Up"),

                        const SizedBox(height: 32),

                        AuthForm(
                          controller:
                          Get.find<SignupController>(),
                          buttonText: "Create Account",
                        ),

                        const Spacer(),

                        const Center(
                          child: Text("Or continue with"),
                        ),

                        const SizedBox(height: 22),

                        const SocialLoginRow(),

                        const SizedBox(height: 42),

                        Center(
                          child: GestureDetector(
                            onTap: () =>
                                Get.offAllNamed(AppRoutes.login),
                            child: const Text(
                              "Already have an account? Log in",
                            ),
                          ),
                        ),

                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}