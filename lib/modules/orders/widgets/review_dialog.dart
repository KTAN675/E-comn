import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import '../../../constant/app_colors.dart';
import '../../../constant/app_text_styles.dart';
import '../../../routes/app_routes.dart';

class ReviewDialog extends StatefulWidget {
  const ReviewDialog({super.key});

  @override
  State<ReviewDialog> createState() => _ReviewDialogState();
}

class _ReviewDialogState extends State<ReviewDialog> {

  int rating = 4;

  final TextEditingController reviewController =
  TextEditingController(text: "I loved it!");

  final List<String> labels = [
    "Very Bad",
    "Bad",
    "Ok-Ok",
    "Good",
    "Very Good"
  ];

  @override
  Widget build(BuildContext context) {

    return Dialog(
      backgroundColor: Colors.transparent,

      child: Container(
        padding: const EdgeInsets.all(20),

        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(26),
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            /// TITLE
            Text(
              "How was the product ?",
              style: AppTextStyles.h2,
            ),

            const SizedBox(height: 18),

            /// RATING STARS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(5, (index) {

                final starIndex = index + 1;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      rating = starIndex;
                    });
                  },

                  child: Column(
                    children: [

                      Icon(
                        Icons.star,
                        size: 34,
                        color: starIndex <= rating
                            ? AppColors.primaryOrange
                            : Colors.grey.shade300,
                      ),

                      const SizedBox(height: 6),

                      Text(
                        labels[index],
                        style: AppTextStyles.caption,
                      )
                    ],
                  ),
                );
              }),
            ),

            const SizedBox(height: 22),

            /// COMMENT TITLE
            Text(
              "Add a comment",
              style: AppTextStyles.bodyLarge.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 10),

            /// COMMENT FIELD
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14),

              decoration: BoxDecoration(
                color: const Color(0xffF6F6F6),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: Colors.grey.shade300,
                ),
              ),

              child: Row(
                children: [

                  Expanded(
                    child: TextField(
                      controller: reviewController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),

                  const Icon(
                    Icons.check_circle_outline,
                    size: 26,
                  )
                ],
              ),
            ),

            const SizedBox(height: 22),

            /// DELIVERY INFO
            Row(
              children: [

                const Icon(Icons.local_shipping_outlined),

                const SizedBox(width: 10),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      "Delivered on time",
                      style: AppTextStyles.bodyLarge.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    Text(
                      "22 May 2025",
                      style: AppTextStyles.bodyGrey,
                    )
                  ],
                )
              ],
            ),

            const SizedBox(height: 14),

            /// SUCCESS MESSAGE
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),

              decoration: BoxDecoration(
                color: const Color(0xffE7F4EC),
                borderRadius: BorderRadius.circular(10),
              ),

              child: Text(
                "✨ Yay! Your Order was delivered 2 days early",
                style: AppTextStyles.bodyGrey,
              ),
            ),

            const SizedBox(height: 16),

            /// RETURN INFO
            Row(
              children: [

                Expanded(
                  child: Text(
                    "Return /Exchange Available till 29 May",
                    style: AppTextStyles.bodyGrey,
                  ),
                ),

                /// RETURN / EXCHANGE BUTTON
                TextButton(

                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xffF1F1F1),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),

                  onPressed: () {},

                  child: RichText(
                    text: TextSpan(
                      style: AppTextStyles.bodyLarge.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      children: [

                        /// RETURN
                        TextSpan(
                          text: "Return",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.back();
                              Get.toNamed(AppRoutes.returns);
                            },
                        ),

                        const TextSpan(
                          text: " / ",
                        ),

                        /// EXCHANGE
                        TextSpan(
                          text: "Exchange",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.back();
                              Get.toNamed(AppRoutes.exchange);
                            },
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}