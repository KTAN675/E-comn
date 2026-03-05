import 'package:flutter/material.dart';

class ExchangeTimeline extends StatelessWidget {

  final List<Map<String, dynamic>> steps;

  const ExchangeTimeline({
    super.key,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      children: steps.map((step) {

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Column(
              children: [

                Icon(
                  step["icon"],
                  color: step["color"],
                ),

                Container(
                  width: 2,
                  height: 40,
                  color: step["color"],
                )
              ],
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    Text(
                      step["title"],
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: step["color"],
                      ),
                    ),

                    if (step["subtitle"] != null)
                      Text(
                        step["subtitle"],
                        style: const TextStyle(color: Colors.grey),
                      ),
                  ],
                ),
              ),
            )
          ],
        );
      }).toList(),
    );
  }
}