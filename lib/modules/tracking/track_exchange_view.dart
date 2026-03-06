import 'package:flutter/material.dart';
import '../../constant/app_colors.dart';
import '../../data/models/order/tracking_model.dart';
import 'widgets/tracking_product_card.dart';
import 'widgets/tracking_timeline.dart';

class TrackExchangeView extends StatelessWidget {
  const TrackExchangeView({super.key});

  @override
  Widget build(BuildContext context) {

    final steps = [

      TrackingStep(
        title: "Exchange Initiated",
        icon: Icons.circle_outlined,
      ),

      TrackingStep(
        title: "Exchange Verified",
        icon: Icons.check_circle_outline,
      ),

      TrackingStep(
        title: "Order Picked up",
        subtitle: "Delivery agent will pick up order at 4:00pm",
        icon: Icons.local_shipping_outlined,
      ),

      TrackingStep(
        title: "Exchanged order shipped",
        icon: Icons.inventory_2_outlined,
      ),

      TrackingStep(
        title: "Dispatched",
        subtitle: "ETA: 2024/07/25",
        icon: Icons.local_shipping,
      ),

      TrackingStep(
        title: "Delivered",
        icon: Icons.inventory,
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.white,

      appBar: AppBar(
        title: const Text("Track Exchange Order"),
        backgroundColor: AppColors.white,
        elevation: 0,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            /// PRODUCT CARD
            const TrackingProductCard(),

            const SizedBox(height: 20),

            /// TIMELINE
            TrackingTimeline(
              steps: steps,
              currentStep: 2,
            ),
          ],
        ),
      ),
    );
  }
}