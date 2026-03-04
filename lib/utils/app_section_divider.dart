import 'package:flutter/material.dart';

class AppSectionDivider extends StatelessWidget {

  final double verticalSpacing;

  const AppSectionDivider({
    super.key,
    this.verticalSpacing = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalSpacing),
      child: Container(
        height: 1,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        color: Color(0xFF868D94),
      ),
    );
  }
}