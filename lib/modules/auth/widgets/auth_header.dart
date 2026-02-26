import 'package:flutter/material.dart';
import '../../../constant/app_images.dart';

class AuthHeader extends StatelessWidget {
  final String title;

  const AuthHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Center(
              child: Image.asset(
                AppImages.logo,
                height: 120,
              ),
            ),

            const SizedBox(height: 45),

            Text(
              title,
              style: const TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w700,
                color: Color(0xff2D3440),
              ),
            ),
          ],
        ),
      ),
    );
  }
}