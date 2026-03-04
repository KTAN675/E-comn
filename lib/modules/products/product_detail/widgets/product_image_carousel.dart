import 'package:e_comm/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'product_image_card.dart';

class ProductImageCarousel extends StatefulWidget {

  final List<String> images;

  const ProductImageCarousel({
    super.key,
    required this.images,
  });

  @override
  State<ProductImageCarousel> createState() =>
      _ProductImageCarouselState();
}

class _ProductImageCarouselState extends State<ProductImageCarousel> {

  final PageController _controller = PageController();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [

        /// CAROUSEL
        SizedBox(
          height: 260,
          child: PageView.builder(
            controller: _controller,
            itemCount: widget.images.length,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (_, index) {

              return ProductImageCard(
                image: widget.images[index],
              );
            },
          ),
        ),

        const SizedBox(height: 12),

        /// DOT INDICATOR
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.images.length,
                (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: currentIndex == index ? 8 : 6,
              height: currentIndex == index ? 8 : 6,
              decoration: BoxDecoration(
                color: currentIndex == index
                    ? AppColors.primaryOrange
                    : Colors.grey.shade400,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}