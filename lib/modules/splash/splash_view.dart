import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../constant/app_colors.dart';
import '../../constant/app_images.dart';
import 'splash_controller.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {

  // ── Animation Controllers ────────────────────────────────────
  late AnimationController _arcController;
  late AnimationController _logoController;
  late AnimationController _pulseController;
  late AnimationController _shimmerController;

  late Animation<double> _arcExpand;
  late Animation<double> _logoFade;
  late Animation<double> _logoScale;
  late Animation<double> _logoSlideY;
  late Animation<double> _pulse;
  late Animation<double> _shimmer;
  late Animation<double> _taglineFade;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    Get.find<SplashController>();

    // 1) Arcs expand
    _arcController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _arcExpand = CurvedAnimation(
      parent: _arcController,
      curve: Curves.easeOutCubic,
    );

    // 2) Logo fade + scale + slide
    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _logoFade   = CurvedAnimation(parent: _logoController, curve: Curves.easeIn);
    _logoScale  = Tween<double>(begin: 0.6, end: 1.0).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.elasticOut),
    );
    _logoSlideY = Tween<double>(begin: 40, end: 0).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.easeOutCubic),
    );

    // 3) Tagline delayed fade
    _taglineFade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _logoController,
        curve: const Interval(0.6, 1.0, curve: Curves.easeIn),
      ),
    );

    // 4) Pulse glow
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat(reverse: true);
    _pulse = Tween<double>(begin: 0.85, end: 1.0).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    // 5) Shimmer
    _shimmerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat();
    _shimmer = Tween<double>(begin: -1.5, end: 1.5).animate(
      CurvedAnimation(parent: _shimmerController, curve: Curves.easeInOut),
    );

    // ── Sequence ────────────────────────────────────────────────
    _arcController.forward().then((_) => _logoController.forward());
  }

  @override
  void dispose() {
    _arcController.dispose();
    _logoController.dispose();
    _pulseController.dispose();
    _shimmerController.dispose();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
      overlays: SystemUiOverlay.values,
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashSoftest,  //  AppColors
      body: Stack(
        children: [

          // ── 1. Animated Arc Background ─────────────────────────
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _arcExpand,
              builder: (_, __) => CustomPaint(
                painter: _AnimatedArcsPainter(
                  colors: const [
                    AppColors.splashSoft,      // outermost
                    AppColors.splashLight,
                    AppColors.splashDeep,
                    AppColors.primaryOrange,   //  brand primary
                    AppColors.splashMid,       // innermost
                  ],
                  progress: _arcExpand.value,
                ),
              ),
            ),
          ),

          // ── 2. Radial depth overlay ─────────────────────────────
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: const Alignment(0.9, -0.9),
                  radius: 1.4,
                  colors: [
                    Colors.white.withOpacity(0.08),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // ── 3. Logo + Text ──────────────────────────────────────
          Center(
            child: AnimatedBuilder(
              animation: _logoController,
              builder: (_, __) => Opacity(
                opacity: _logoFade.value,
                child: Transform.translate(
                  offset: Offset(0, _logoSlideY.value),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      // Logo with pulse glow
                      AnimatedBuilder(
                        animation: _pulseController,
                        builder: (_, child) => Transform.scale(
                          scale: _pulse.value,
                          child: child,
                        ),
                        child: ScaleTransition(
                          scale: _logoScale,
                          child: Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(34),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.splashDeep.withOpacity(0.45),
                                  blurRadius: 50,
                                  spreadRadius: 8,
                                  offset: const Offset(0, 18),
                                ),
                                BoxShadow(
                                  color: AppColors.white.withOpacity(0.18),      //
                                  blurRadius: 20,
                                  spreadRadius: 2,
                                  offset: const Offset(0, -4),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(34),
                              child: Image.asset(
                                AppImages.splashLogo,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 32),

                      // App name
                      Text(
                        'Realtime_User',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 42,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.5,
                          shadows: [
                            Shadow(
                              color: AppColors.black.withOpacity(0.25),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 8),

                      // Shimmer tagline
                      FadeTransition(
                        opacity: _taglineFade,
                        child: AnimatedBuilder(
                          animation: _shimmerController,
                          builder: (_, child) => ShaderMask(
                            shaderCallback: (bounds) => LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: const [
                                Colors.white60,
                                Colors.white,
                                Colors.white60,
                              ],
                              stops: [
                                (_shimmer.value - 0.4).clamp(0.0, 1.0),
                                _shimmer.value.clamp(0.0, 1.0),
                                (_shimmer.value + 0.4).clamp(0.0, 1.0),
                              ],
                            ).createShader(bounds),
                            child: child,
                          ),
                          child: const Text(
                            'USER APP',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 5.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // ── 4. Bottom loader ────────────────────────────────────
          Positioned(
            bottom: 48,
            left: 0,
            right: 0,
            child: AnimatedBuilder(
              animation: _logoController,
              builder: (_, __) => Opacity(
                opacity: _logoFade.value,
                child: Column(
                  children: [
                    SizedBox(
                      width: 120,
                      child: LinearProgressIndicator(
                        backgroundColor: AppColors.white.withOpacity(0.2), //
                        valueColor: const AlwaysStoppedAnimation(AppColors.white), //
                        minHeight: 3,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Loading...',
                      style: TextStyle(
                        color: AppColors.white.withOpacity(0.6), //
                        fontSize: 12,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Painter
// ─────────────────────────────────────────────────────────────────────────────
class _AnimatedArcsPainter extends CustomPainter {
  final List<Color> colors;
  final double progress;

  _AnimatedArcsPainter({required this.colors, required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final origin = Offset(w * 1.05, -h * 0.05);
    final baseRadii = [h * 1.4, h * 1.15, h * 0.9, h * 0.65, h * 0.35];

    for (int i = 0; i < colors.length; i++) {
      if (i < baseRadii.length) {
        final paint = Paint()
          ..color = colors[i]
          ..style = PaintingStyle.fill;
        canvas.drawCircle(origin, baseRadii[i] * progress, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _AnimatedArcsPainter old) =>
      old.progress != progress;
}
