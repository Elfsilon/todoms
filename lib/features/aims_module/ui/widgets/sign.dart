import 'package:flutter/material.dart';
import 'package:todoms/shared/models/custom_color.dart';

class Sign extends StatelessWidget {
  const Sign({
    super.key,
    required this.icon,
    required this.color,
    required this.important,
  });

  final IconData icon;
  final CustomColor color;
  final bool important;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: important ? color.muted.withOpacity(0.2) : color.muted,
        border: Border.all(color: important ? color.primary : Colors.transparent),
      ),
      child: Icon(icon, color: color.primary),
    );
  }
}
