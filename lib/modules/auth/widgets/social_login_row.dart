import 'package:flutter/material.dart';
import '../../../constant/app_colors.dart';
import '../../../../constant/app_images.dart';

class SocialLoginRow extends StatelessWidget {
  const SocialLoginRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _social(AppImages.google),
        _social(AppImages.apple),
        _social(AppImages.facebook),
      ],
    );
  }

  Widget _social(String asset) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.accent),
      ),
      child: Center(
        child: Image.asset(asset, height: 26),
      ),
    );
  }
}