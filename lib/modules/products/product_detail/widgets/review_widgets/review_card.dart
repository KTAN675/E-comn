import 'package:e_comm/utils/app_section_divider.dart';
import 'package:flutter/material.dart';
import '../../../../../constant/app_text_styles.dart';
import '../../../../../data/models/review/review_model.dart';

class ReviewItem extends StatelessWidget {
  final ReviewModel review;
  final VoidCallback onLike;
  final VoidCallback onDislike;

  const ReviewItem({
    super.key,
    required this.review,
    required this.onLike,
    required this.onDislike,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Row(
          children: [

            const CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage("assets/images/profile.png"),
            ),

            const SizedBox(width: 10),

            Expanded(
              child: Text(
                review.name,
                style: AppTextStyles.bodyLarge.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            _ReactionButton(
              icon: Icons.thumb_up_alt_outlined,
              count: review.likes,
              isLiked: review.isLiked,
              onTap: onLike,
            ),

            const SizedBox(width: 8),

            _ReactionButton(
              icon: Icons.thumb_down_alt_outlined,
              count: review.dislikes,
              isDisliked: review.isDisliked,
              onTap: onDislike,
            ),
          ],
        ),

        const SizedBox(height: 8),

        Text(
          review.review,
          style: AppTextStyles.bodyLarge.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 4),

        Text(
          review.date,
          style: AppTextStyles.caption,
        ),

        const SizedBox(height: 8),

        Row(
          children: List.generate(
            review.rating,
                (index) => const Icon(
              Icons.star,
              size: 18,
              color: Colors.amber,
            ),
          ),
        ),

        const SizedBox(height: 16),

        AppSectionDivider(),
      ],
    );
  }
}


class _ReactionButton extends StatelessWidget {
  final IconData icon;
  final int? count;
  final bool isLiked;
  final bool isDisliked;
  final VoidCallback? onTap;

  const _ReactionButton({
    required this.icon,
    this.count,
    this.isLiked = false,
    this.isDisliked = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    Color iconColor = Colors.grey;

    if (isLiked) iconColor = Colors.green;
    if (isDisliked) iconColor = Colors.red;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade400),
        ),
        child: Row(
          children: [
            Icon(icon, size: 16, color: iconColor),

            if (count != null) ...[
              const SizedBox(width: 4),
              Text(
                count.toString(),
                style: AppTextStyles.caption,
              ),
            ],
          ],
        ),
      ),
    );
  }
}