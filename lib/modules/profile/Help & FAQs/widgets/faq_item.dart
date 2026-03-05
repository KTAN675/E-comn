import 'package:flutter/material.dart';

import '../../../../constant/app_colors.dart';

class FaqItem extends StatelessWidget {
  final int index;
  final String question;
  final String answer;
  final bool isOpen;
  final VoidCallback onTap;

  const FaqItem({
    super.key,
    required this.index,
    required this.question,
    required this.answer,
    required this.isOpen,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                "0${index + 1}",
                style: const TextStyle(
                  fontSize: 22,
                  color: AppColors.primaryOrange,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            question,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Icon(
                          isOpen ? Icons.close : Icons.add,
                          color: AppColors.primaryOrange,
                        )
                      ],
                    ),

                    if (isOpen) ...[
                      const SizedBox(height: 10),
                      Text(
                        answer,
                        style: TextStyle(color: Colors.grey.shade600),
                      )
                    ]
                  ],
                ),
              )
            ],
          ),
        ),

        const Divider(height: 30)
      ],
    );
  }
}