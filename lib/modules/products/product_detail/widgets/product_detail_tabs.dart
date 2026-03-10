import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constant/app_colors.dart';
import '../../../../constant/app_text_styles.dart';
import '../../../theme/theme_controller.dart';

class ProductDetailTabs extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChanged;

  const ProductDetailTabs({
    super.key,
    required this.selectedIndex,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {

    return GetBuilder<ThemeController>(
      builder: (theme) {
        final Color accent = AppColors.accent;

        return Column(
          children: [

            /// TAB TITLES
            Row(
              children: [

                Expanded(
                  child: GestureDetector(
                    onTap: () => onTabChanged(0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Center(
                        child: Text(
                          "Delivery & Services",
                          style: selectedIndex == 0
                              ? AppTextStyles.h3
                              : AppTextStyles.bodyGrey,
                        ),
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: GestureDetector(
                    onTap: () => onTabChanged(1),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Center(
                        child: Text(
                          "Product Details",
                          style: selectedIndex == 1
                              ? AppTextStyles.h3
                              : AppTextStyles.bodyGrey,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            /// UNDERLINE INDICATOR
            Row(
              children: [

                Expanded(
                  child: Container(
                    height: 3,
                    color: selectedIndex == 0
                        ? accent
                        : Colors.transparent,
                  ),
                ),

                Expanded(
                  child: Container(
                    height: 3,
                    color: selectedIndex == 1
                        ? accent
                        : Colors.transparent,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}