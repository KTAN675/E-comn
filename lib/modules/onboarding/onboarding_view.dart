import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/app_colors.dart';
import '../../constant/app_images.dart';
import '../../constant/app_text_styles.dart';
import '../../modules/theme/theme_controller.dart';
import '../../routes/app_routes.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _controller = PageController();
  int _currentPage = 0;
  Timer? _timer;

  final List<_BoardItem> pages = [
    _BoardItem(
      image: AppImages.onboarding1,
      title: "All Your Daily Essentials in One App",
      desc: "Order fresh groceries, medicines, fish, and meat from one place. Everything you need delivered quickly and conveniently to your doorstep.",
    ),
    _BoardItem(
      image: AppImages.onboarding2,
      title: "Freshness You Can Trust",
      desc: "Get farm-fresh groceries, hygienic meat & fish, and genuine medicines sourced from trusted sellers and delivered with care.",
    ),
    _BoardItem(
      image: AppImages.onboarding3,
      title: "Quick & Easy Delivery",
      desc: "Place your order in seconds and enjoy fast doorstep delivery. Save time and shop smarter with our all-in-one shopping app.",
    ),
  ];

  @override
  void initState() {
    super.initState();
    _startAutoPlay();
  }

  void _startAutoPlay() {
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (_currentPage < pages.length - 1) {
        _controller.nextPage(
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
        );
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final accent = Get.find<ThemeController>().currentAccent;

    return Scaffold(
      // The background color of the scaffold should match the light pink in your design
      backgroundColor: const Color(0xFFFFEFEF),
      body: Stack(
        children: [
          /// 1. TOP CLIPPED IMAGE AREA
          ClipPath(
            clipper: BottomCurveClipper(),
            child: Container(
              height: h * 0.58, // Height of the image section
              width: double.infinity,
              color: Colors.white, // Fallback background for the image
              child: PageView.builder(
                controller: _controller,
                itemCount: pages.length,
                onPageChanged: (i) => setState(() => _currentPage = i),
                itemBuilder: (context, i) {
                  return Image.asset(
                    pages[i].image,
                    fit: BoxFit.cover, // 🔹 Makes image fill every pixel of the top area
                    width: double.infinity,
                  );
                },
              ),
            ),
          ),

          /// 2. UI LAYER (Text, Dots, Buttons)
          SafeArea(
            child: Column(
              children: [
                /// SKIP BUTTON
                Padding(
                  padding: const EdgeInsets.only(right: 20, top: 8),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        _timer?.cancel();
                        Get.offAllNamed(AppRoutes.login);
                      },
                      child: Text(
                        "Skip",
                        style: AppTextStyles.bodyLarge.copyWith(
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff2D3440),
                        ),
                      ),
                    ),
                  ),
                ),

                const Spacer(), // Automatically pushes content below the curved image

                /// CONTENT SECTION
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 36),
                  child: Text(
                    pages[_currentPage].title,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.h1.copyWith(
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 44),
                  child: Text(
                    pages[_currentPage].desc,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.body.copyWith(
                      color: const Color(0xff24252C),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                /// DOTS INDICATOR
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    pages.length,
                        (i) => AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      margin: const EdgeInsets.only(right: 8),
                      height: 10,
                      width: _currentPage == i ? 22 : 10,
                      decoration: BoxDecoration(
                        color: _currentPage == i ? accent : const Color(0xffBDBDBD),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                /// CONTINUE BUTTON
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        _timer?.cancel();
                        if (_currentPage == pages.length - 1) {
                          Get.offAllNamed(AppRoutes.login);
                        } else {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOut,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: accent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        _currentPage == pages.length - 1 ? "Continue" : "Next",
                        style: AppTextStyles.button.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// 🔹 THE CLIPPER: This creates the curve from your image
class BottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    // Start at top-left
    path.lineTo(0, size.height - 80);

    // Create a smooth downward curve to the bottom-right
    path.quadraticBezierTo(
      size.width / 2, // Control Point: Center-bottom
      size.height + 80, // Depth of the curve
      size.width, // End Point: Right side
      size.height - 80,
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class _BoardItem {
  final String image, title, desc;
  _BoardItem({required this.image, required this.title, required this.desc});
}