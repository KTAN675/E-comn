import 'package:flutter/material.dart';
import '../../../../../constant/app_colors.dart';
import '../../../../../constant/app_text_styles.dart';

class ReviewsHeader extends StatelessWidget {
  const ReviewsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        /// RATING BADGE
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 6,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryOrange),
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Text(
            "4.8",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        const SizedBox(width: 10),

        /// STARS
        const Row(
          children: [
            Icon(Icons.star, size: 18, color: Colors.amber),
            Icon(Icons.star, size: 18, color: Colors.amber),
            Icon(Icons.star, size: 18, color: Colors.amber),
            Icon(Icons.star, size: 18, color: Colors.amber),
            Icon(Icons.star_half, size: 18, color: Colors.amber),
          ],
        ),

        const SizedBox(width: 10),

        Text(
          "from 26k reviews",
          style: AppTextStyles.caption,
        ),
      ],
    );
  }
}