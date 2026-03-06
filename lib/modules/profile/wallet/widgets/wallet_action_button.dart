import 'package:flutter/material.dart';

import '../../../../utils/app_primary_button.dart';

class WalletActionButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const WalletActionButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppPrimaryButton(
      title: title,
      onTap: onTap,
      height: 40,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );
  }
}