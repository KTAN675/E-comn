
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:realtime_user/modules/products/widgets/product_card_mini.dart';
import '../../../data/models/product/product_model.dart';
import '../../category/category_navigator.dart';
import '../../../routes/app_routes.dart';
import '../../mian_shell/main_shell_controller.dart';

class ListingProductsGrid extends StatelessWidget {
  final List<ProductModel> products;
  final Color accent;

  const ListingProductsGrid({
    super.key,
    required this.products,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    double ratio;

    if (width < 360) {
      ratio = 0.49;
    } else if (width < 420) {
      ratio = 0.48;
    } else if (width < 600) {
      ratio = 0.62;
    } else {
      ratio = 0.70;
    }

    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 20),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: ratio,
      ),
      itemBuilder: (context, index) {
        final product = products[index];

        return GestureDetector(
          onTap: () {

            Get.find<MainShellController>().hideNavBar();

            CategoryNavigator.navigatorKey.currentState?.pushNamed(
              AppRoutes.productDetails,
              arguments: product,
            );
          },
          child: ProductCardMini(
            product: product,
            accent: accent,
            discountColor: accent,
          ),
        );
      },
    );
  }
}