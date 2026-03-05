import 'package:flutter/material.dart';

class PointsTaskTile extends StatelessWidget {

  final IconData icon;
  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback onTap;

  const PointsTaskTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xffF6EFEA),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [

          Icon(icon, color: Colors.orange),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600)),
                Text(subtitle,
                    style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),

          ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
            ),
            child: Text(buttonText),
          )

        ],
      ),
    );
  }
}