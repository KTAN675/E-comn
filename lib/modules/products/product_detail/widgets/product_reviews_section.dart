import 'package:e_comm/modules/products/product_detail/product_detail_controller.dart';
import 'package:e_comm/modules/products/product_detail/widgets/review_widgets/rating_distribution.dart';
import 'package:e_comm/modules/products/product_detail/widgets/review_widgets/review_filters.dart';
import 'package:e_comm/modules/products/product_detail/widgets/review_widgets/reviews_header.dart';
import 'package:e_comm/modules/products/product_detail/widgets/review_widgets/add_question_widget.dart';
import 'package:e_comm/modules/products/product_detail/widgets/review_widgets/review_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constant/app_text_styles.dart';

class ProductReviewsSection extends GetView<ProductDetailController> {
  const ProductReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// TITLE
          Text(
            "Product Reviews",
            style: AppTextStyles.h3,
          ),

          const SizedBox(height: 14),

          const ReviewsHeader(),

          const SizedBox(height: 16),

          const RatingDistribution(),

          const SizedBox(height: 20),

          const ReviewFilters(),

          const SizedBox(height: 20),

          /// ADD QUESTION
          AddQuestionWidget(
            controller: controller.questionController,
            onSubmit: controller.submitQuestion,
          ),

          const SizedBox(height: 24),

          /// REVIEWS
          GetBuilder<ProductDetailController>(
            builder: (controller) {
              return Column(
                children: List.generate(
                  controller.reviews.length,
                      (index) {
                    final review = controller.reviews[index];

                    return ReviewItem(
                      review: review,
                      onLike: () => controller.toggleLike(index),
                      onDislike: () => controller.toggleDislike(index),
                    );
                  },
                ),
              );
            },
          )

        ],
      ),
    );
  }
}