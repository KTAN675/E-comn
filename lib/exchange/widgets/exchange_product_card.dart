import '..//exchange_controller.dart';
import 'package:flutter/material.dart';

class ExchangeProductCard extends StatelessWidget {

  const ExchangeProductCard({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            color: Colors.grey.shade200,
          )
        ],
      ),

      child: Row(
        children: [

          Image.network(
            "https://i.imgur.com/8Km9tLL.png",
            width: 70,
            height: 90,
            fit: BoxFit.cover,
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [

                Text(
                  "Long Sleeve Overshirt, Khaki, 6",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),

                SizedBox(height: 6),

                Text("Delivering at : Pune, Maharashtra"),

                SizedBox(height: 4),

                Text("Size: 10"),

                Text("Color: Brown"),

                SizedBox(height: 6),

                Text(
                  "₹366   ₹999",
                  style: TextStyle(color: Colors.orange),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}