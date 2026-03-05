import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/models/product/product_model.dart';
import '../../routes/app_routes.dart';
import '../products/product_detail/product_detail_controller.dart';
import '../products/product_detail/product_detail_view.dart';
import '../products/product_listing_controller.dart';
import '../products/product_listing_view.dart';
import '../vendor_categories/vendor_categories_controller.dart';
import '../vendor_categories/vendor_categories_view.dart';
import 'category_view.dart';

class CategoryNavigator extends StatelessWidget {
  const CategoryNavigator({super.key});

  static final GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {

        /// 🔹 Vendor Categories Screen
          case '/vendor-categories':
            return MaterialPageRoute(
              builder: (_) {

                Get.delete<VendorCategoriesController>(force: true);

                Get.put(VendorCategoriesController());

                return const VendorCategoriesView();
              },
            );

        /// 🔹 Product Listing Screen
          case '/product-listing':
            final args = settings.arguments as Map?;

            return MaterialPageRoute(
              builder: (_) {

                Get.delete<ProductListingController>(force: true);

                Get.put(
                  ProductListingController(
                    isGrocery: args?['isGrocery'] ?? true,
                  ),
                );

                return const ProductListingView();
              },
            );

        /// 🔹 Product Detail Screen
          case AppRoutes.productDetails:

            final product = settings.arguments as ProductModel;

            return MaterialPageRoute(
              builder: (_) {

                /// Remove old instance
                Get.delete<ProductDetailController>(force: true);

                /// Create new instance
                final controller = Get.put(ProductDetailController());

                /// Inject product
                controller.product = product;

                return const ProductDetailView();
              },
            );

        /// 🔹 Default → Category Root
          default:
            return MaterialPageRoute(
              builder: (_) => const CategoryView(),
            );
        }
      },
    );
  }
}