import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool enabled;
  final FocusNode? focusNode;
  final int maxLength;

  const AppTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.enabled,
    required this.maxLength,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      enabled: enabled,
      maxLength: maxLength,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        counterText: "",
        hintText: hint,
        filled: true,
        fillColor: const Color(0xffE9E9E9),
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}