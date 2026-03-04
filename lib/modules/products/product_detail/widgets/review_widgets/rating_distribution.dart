import 'package:flutter/material.dart';

class RatingDistribution extends StatelessWidget {
  const RatingDistribution({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [

        RatingBarRow(stars: 5, value: 0.85, count: 4891),
        RatingBarRow(stars: 4, value: 0.40, count: 838),
        RatingBarRow(stars: 3, value: 0.05, count: 8),
        RatingBarRow(stars: 2, value: 0.01, count: 0),
        RatingBarRow(stars: 1, value: 0.01, count: 0),
      ],
    );
  }
}

class RatingBarRow extends StatelessWidget {
  final int stars;
  final double value;
  final int count;

  const RatingBarRow({
    super.key,
    required this.stars,
    required this.value,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [

          Text("$stars.0"),

          const SizedBox(width: 6),

          const Icon(Icons.star, size: 14, color: Colors.amber),

          const SizedBox(width: 8),

          Expanded(
            child: LinearProgressIndicator(
              value: value,
              minHeight: 6,
              backgroundColor: Colors.grey.shade300,
              valueColor: AlwaysStoppedAnimation(
                stars >= 4
                    ? Colors.green
                    : stars == 3
                    ? Colors.orange
                    : Colors.red,
              ),
            ),
          ),

          const SizedBox(width: 10),

          SizedBox(
            width: 40,
            child: Text(
              count.toString(),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}