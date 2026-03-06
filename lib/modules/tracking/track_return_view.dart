import 'package:flutter/material.dart';
import '../../constant/app_colors.dart';
import '../../data/models/order/tracking_model.dart';
import 'widgets/tracking_product_card.dart';
import 'widgets/tracking_timeline.dart';

class TrackReturnView extends StatelessWidget {
  const TrackReturnView({super.key});

  @override
  Widget build(BuildContext context) {

    final steps = [

      TrackingStep(
        title: "Return Initiated",
        icon: Icons.circle_outlined,
      ),

      TrackingStep(
        title: "Return Verified",
        icon: Icons.check_circle_outline,
      ),

      TrackingStep(
        title: "Order Picked up",
        subtitle: "Delivery agent picked up order at 4:00pm",
        icon: Icons.local_shipping_outlined,
      ),

      TrackingStep(
        title: "Refund Initiated",
        icon: Icons.payments_outlined,
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.white,

      appBar: AppBar(
        title: const Text("Track Return Order"),
        backgroundColor: AppColors.white,
        elevation: 0,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            const TrackingProductCard(),

            const SizedBox(height: 20),

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