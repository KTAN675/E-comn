import 'package:e_comm/modules/cart/widgets/payment_methods_section.dart';
import 'package:e_comm/modules/cart/widgets/place_order_button.dart';
import 'package:e_comm/modules/cart/widgets/recommended_products_section.dart';
import 'package:e_comm/modules/cart/widgets/delivery_address_card.dart';
import 'package:e_comm/modules/cart/widgets/wallet_section.dart';
import 'package:e_comm/modules/cart/widgets/order_summary_section.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/app_colors.dart';
import 'cart_controller.dart';
import 'widgets/cart_header.dart';
import 'widgets/cart_item_card.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      body: SafeArea(
        bottom: false,
        child: Column(
          children: [

            /// HEADER
            const CartHeader(),

            /// CONTENT
            Expanded(
              child: GetBuilder<CartController>(
                builder: (controller) {

                  /// EMPTY CART
                  if (controller.cartItems.isEmpty) {
                    return const Center(
                      child: Text("Your cart is empty"),
                    );
                  }

                  return SingleChildScrollView(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Column(
                      children: [

                        /// CART ITEMS
                        ...List.generate(
                          controller.cartItems.length,
                              (index) {

                            final item = controller.cartItems[index];

                            return CartItemCard(
                              item: item,
                              onIncrease: () =>
                                  controller.increaseQty(index),
                              onDecrease: () =>
                                  controller.decreaseQty(index),
                              onWishlist: () =>
                                  controller.moveToWishlist(index),
                            );
                          },
                        ),

                        const SizedBox(height: 16),

                        /// RECOMMENDED PRODUCTS
                        CartRecommendationsSection(
                          products: controller.recommendedProducts,
                          onAdd: (product) {
                            controller.addToCart(product);
                          },
                        ),

                        const SizedBox(height: 5),

                        /// PAYMENT METHODS
                        const PaymentMethodSection(),

                        const SizedBox(height: 5),

                        /// DELIVERY ADDRESS
                        const DeliveryAddressCard(),

                        const SizedBox(height: 5),

                        /// WALLET SECTION
                        const WalletSection(),

                        const SizedBox(height: 5),

                        /// ORDER SUMMARY
                        const OrderSummarySection(),

                        const SizedBox(height: 5),

                        /// PLACE ORDER BUTTON
                         PlaceOrderSection(
                           onTap: controller.placeOrder,
                         ),

                        const SizedBox(height: 100),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}