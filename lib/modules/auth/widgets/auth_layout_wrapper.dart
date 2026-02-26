import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  final Widget top;
  final Widget middle;
  final Widget bottom;

  const AuthLayout({
    super.key,
    required this.top,
    required this.middle,
    required this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F4F4),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [

            /// TOP + FORM SECTION (Scrollable only if needed)
            Expanded(
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                ScrollViewKeyboardDismissBehavior.onDrag,
                padding:
                const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    top,
                    const SizedBox(height: 32),
                    middle,
                  ],
                ),
              ),
            ),

            /// FIXED BOTTOM SECTION
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 24),
              child: bottom,
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}