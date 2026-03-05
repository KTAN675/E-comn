// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../cart_controller.dart';
// import 'cart_item_card.dart';
//
// class CartItemsSection extends GetView<CartController> {
//   const CartItemsSection({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: Column(
//         children: List.generate(
//           controller.cartItems.length,
//               (index) {
//
//             final product = controller.cartItems[index];
//
//             return Padding(
//               padding: const EdgeInsets.only(bottom: 12),
//               child: CartItemCard(product: product),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }