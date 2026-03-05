import 'package:e_comm/modules/products/product_detail/product_detail_controller.dart';
import 'package:e_comm/modules/products/product_detail/widgets/delivery_services_content.dart';
import 'package:e_comm/modules/products/product_detail/widgets/frequently_bought_together.dart';
import 'package:e_comm/modules/products/product_detail/widgets/product_detail_tabs.dart';
import 'package:e_comm/modules/products/product_detail/widgets/product_details_content.dart';
import 'package:e_comm/modules/products/product_detail/widgets/product_image_carousel.dart';
import 'package:e_comm/modules/products/product_detail/widgets/product_reviews_section.dart';
import 'package:e_comm/modules/products/product_detail/widgets/you_may_also_like_section.dart';
import 'package:e_comm/utils/app_section_divider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/product_header.dart';
import 'widgets/product_info_section.dart';
import 'widgets/product_price_stepper.dart';
import 'widgets/product_description.dart';
import 'widgets/product_action_buttons.dart';

class ProductDetailView extends GetView<ProductDetailController> {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GetBuilder<ProductDetailController>(
          builder: (controller) {

            final product = controller.product;

            return Column(
              children: [

                /// SCROLLABLE CONTENT
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        ProductHeader(
                          onBack: () => Get.back(),
                        ),

                        ProductImageCarousel(
                          images: [
                            product.image,
                            product.image,
                            product.image,
                          ],
                        ),

                        const SizedBox(height: 16),

                        ProductInfoSection(
                          title: product.title,
                          shop: "Farm Shop",
                        ),

                        const SizedBox(height: 12),

                        ProductPriceStepper(
                          price: product.price,
                          oldPrice: product.oldPrice ?? 0,
                          qty: controller.quantity,
                          onAdd: controller.increaseQty,
                          onRemove: controller.decreaseQty,
                        ),

                        AppSectionDivider(),

                        ProductDescription(
                          description:
                          "Strawberries need to be stored in a cool and dry place after they have been picked.",
                        ),

                        const ProductActionButtons(),

                        ProductDetailTabs(
                          selectedIndex: controller.selectedTab,
                          onTabChanged: controller.changeTab,
                        ),

                        const SizedBox(height: 10),

                        if (controller.selectedTab == 0)
                          const DeliveryServicesContent(),

                        if (controller.selectedTab == 1)
                          const ProductDetailsContent(),

                        const SizedBox(height: 20,),

                        FrequentlyBoughtTogether(
                          products: controller.bundleProducts,
                          totalPrice: 651,
                          // onTap: controller.buyBundle,
                        ),

                        const SizedBox(height: 20,),

                        ProductReviewsSection(),

                        const SizedBox(height: 20,),

                        YouMayAlsoLikeSection(
                          products: controller.recommendedProducts,
                        ),

                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),

                /// BOTTOM ACTION BUTTONS

              ],
            );
          },
        ),
      ),
    );
  }
}
