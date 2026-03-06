import 'package:flutter/material.dart';
import '../../../constant/app_colors.dart';
import '../../../constant/app_text_styles.dart';
import '../../../data/models/order/tracking_model.dart';

class TrackingTimeline extends StatelessWidget {
  final List<TrackingStep> steps;
  final int currentStep;

  const TrackingTimeline({
    super.key,
    required this.steps,
    required this.currentStep,
  });

  Color _getColor(int index) {
    if (index < currentStep) return Colors.green;
    if (index == currentStep) return Colors.orange;
    return Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(steps.length, (index) {
        final step = steps[index];

        final color = _getColor(index);
        final isLast = index == steps.length - 1;

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// LEFT SIDE (NODE + LINE)
            SizedBox(
              width: 40,
              child: Column(
                children: [

                  /// NODE
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: color, width: 2),
                      color: index < currentStep
                          ? color
                          : Colors.white,
                    ),
                    child: Icon(
                      step.icon,
                      size: 14,
                      color: index < currentStep
                          ? Colors.white
                          : color,
                    ),
                  ),

                  /// CONNECTOR LINE
                  if (!isLast)
                    Container(
                      width: 2,
                      height: 50,
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      color: Colors.grey.shade300,
                    ),
                ],
              ),
            ),

            const SizedBox(width: 10),

            /// TEXT
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    step.title,
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: color,
                    ),
                  ),

                  if (step.subtitle != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      step.subtitle!,
                      style: AppTextStyles.bodyGrey,
                    ),
                  ],

                  const SizedBox(height: 30),
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}