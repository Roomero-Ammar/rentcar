import 'package:flutter/material.dart';

class FeatureIcon extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const FeatureIcon({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: Column(
        children: [
          Icon(icon, size: 28),
          Text(title),
          Text(
            subtitle,
            style: TextStyle(color: Colors.grey, fontSize: 10),
          ),
        ],
      ),
    );
  }
}