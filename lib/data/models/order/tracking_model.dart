import 'package:flutter/cupertino.dart';

class TrackingStep {
  final String title;
  final String? subtitle;
  final IconData icon;

  TrackingStep({
    required this.title,
    this.subtitle,
    required this.icon,
  });
}