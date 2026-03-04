import 'package:flutter/material.dart';

import '../../../../constant/app_text_styles.dart';
//import '../../../constant/app_text_styles.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;
  final String date;
  final Color accent;
  final Color backgroundColor;

  const NotificationCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.date,
    required this.accent,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            title,
            style: AppTextStyles.h3.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            subtitle,
            style: AppTextStyles.body.copyWith(
              fontSize: 12,
              color: Colors.grey.shade700,
            ),
          ),

          const SizedBox(height: 10),

          Row(
            children: [
              Text(
                time,
                style: AppTextStyles.caption.copyWith(
                  fontSize: 10,
                  color: accent,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 6),
              Text("•",
                  style: AppTextStyles.caption),
              const SizedBox(width: 6),
              Text(
                date,
                style: AppTextStyles.caption.copyWith(
                  fontSize: 10,
                  color: accent,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}