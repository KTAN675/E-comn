import 'package:flutter/material.dart';

import '../../../../../constant/app_colors.dart';

class PredefinedAmountChip extends StatelessWidget {
  final int amount;
  final bool isSelected;
  final VoidCallback onSelected;

  const PredefinedAmountChip({
    Key? key,
    required this.amount,
    required this.isSelected,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text("₹$amount"),
      selected: isSelected,
      selectedColor: AppColors.primaryOrange,
      onSelected: (_) => onSelected(),
    );
  }
}
