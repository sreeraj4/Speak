import 'package:flutter/material.dart';

class RippleIconbutton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final double iconSize;
  const RippleIconbutton({super.key, required this.onTap, required this.icon, required this.iconSize});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      color: Colors.blue,
      borderRadius: BorderRadius.circular(50),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(50),
        splashColor: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(icon, size: iconSize, color: Colors.white),
        ),
      ),
    );
  }
}
