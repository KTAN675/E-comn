import 'package:flutter/material.dart';

class ReturnProductCard extends StatelessWidget {
  final String image;
  final String title;
  final String location;
  final String size;
  final String color;
  final String arrivalDate;
  final String price;
  final String oldPrice;

  const ReturnProductCard({
    super.key,
    required this.image,
    required this.title,
    required this.location,
    required this.size,
    required this.color,
    required this.arrivalDate,
    required this.price,
    required this.oldPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.1),
            blurRadius: 6,
            spreadRadius: 2,
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// Product Image
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              image,
              width: 80,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 12),

          /// Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// Title
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 4),

                /// Delivery Location
                Text(
                  "Delivering at : $location",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                  ),
                ),

                const SizedBox(height: 6),

                /// Size & Color
                Row(
                  children: [

                    Text(
                      "Size: $size",
                      style: const TextStyle(fontSize: 13),
                    ),

                    const SizedBox(width: 10),

                    Text(
                      "Color: $color",
                      style: const TextStyle(fontSize: 13),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                /// Arrival Date
                Text(
                  "Arriving by : $arrivalDate",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                  ),
                ),

                const SizedBox(height: 8),

                /// Price
                Row(
                  children: [

                    Text(
                      price,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(width: 8),

                    Text(
                      oldPrice,
                      style: const TextStyle(
                        fontSize: 14,
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}