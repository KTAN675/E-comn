  import 'package:flutter/material.dart';
  import '../../../../../constant/app_colors.dart';
  import '../../../../../constant/app_text_styles.dart';

  class AddQuestionWidget extends StatelessWidget {
    final TextEditingController controller;
    final VoidCallback? onSubmit;

    const AddQuestionWidget({
      super.key,
      required this.controller,
      this.onSubmit,
    });

    @override
    Widget build(BuildContext context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// TITLE
           Text(
            "Add a Question",
            style: AppTextStyles.h3,
          ),

          const SizedBox(height: 12),

          /// INPUT FIELD
          Container(
            height: 54,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: AppColors.border,
                width: 1.2,
              ),
            ),
            child: Row(
              children: [

                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: "How many Pieces will be there?",
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      isCollapsed: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                    style: AppTextStyles.body,
                  ),
                ),
                GestureDetector(
                  onTap: onSubmit,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 1.5),
                    ),
                    child: const Icon(Icons.check, size: 18),
                  ),
                ),
              ],
            ),
          )      ],
      );
    }
  }