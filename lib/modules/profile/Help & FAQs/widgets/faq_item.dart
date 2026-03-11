import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constant/app_colors.dart';
import '../../../theme/theme_controller.dart';

class FaqItem extends StatelessWidget {
  final int index;
  final String question;
  final String answer;
  final bool isOpen;

  const FaqItem({
    super.key,
    required this.index,
    required this.question,
    required this.answer,
    required this.isOpen,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (theme) {

        final Color accent = theme.currentAccent; // ✅ Dynamic accent

        return Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// Red Bold Number
              Text(
                index < 9 ? "0${index + 1}" : "${index + 1}",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: accent, // ✅ Dynamic
                ),
              ),

              const SizedBox(height: 6),

              /// Question + Plain Icon
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      question,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    child: Icon(
                      isOpen ? Icons.cancel : Icons.add,
                      color: accent, // ✅ Dynamic
                      size: 26,
                    ),
                  ),
                ],
              ),

              /// Answer
              if (isOpen) ...[
                const SizedBox(height: 10),
                Text(
                  answer,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                    height: 1.6,
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}