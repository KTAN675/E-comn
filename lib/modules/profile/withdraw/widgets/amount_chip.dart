import 'package:flutter/material.dart';

class AmountChip extends StatelessWidget {
  final int amount;
  final bool isSelected;
  final VoidCallback onTap;

  const AmountChip({
    super.key,
    required this.amount,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 14),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected
                  ? const Color(0xffFFE7D6)
                  : const Color(0xffE9E9E9),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: isSelected
                    ? const Color(0xffFF6A00)
                    : Colors.grey.shade400,
              ),
            ),
            child: Text(
              "₹$amount",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: isSelected
                    ? const Color(0xffFF6A00)
                    : Colors.black87,
              ),
            ),
          ),
        ),
      ),
    );
  }
}