import 'package:flutter/material.dart';

class ReturnTrackingTimeline extends StatelessWidget {
  const ReturnTrackingTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [

        ListTile(
          leading: Icon(Icons.circle, color: Colors.green),
          title: Text("Return Initiated"),
        ),

        ListTile(
          leading: Icon(Icons.check_circle, color: Colors.green),
          title: Text("Return Verified"),
        ),

        ListTile(
          leading: Icon(Icons.local_shipping, color: Colors.orange),
          title: Text("Order Picked up"),
          subtitle: Text("Delivery agent picked up order at 4:00pm"),
        ),

        ListTile(
          leading: Icon(Icons.payments, color: Colors.grey),
          title: Text("Refund Initiated"),
        ),
      ],
    );
  }
}