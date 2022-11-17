import 'package:flutter/material.dart';
import 'package:todoms/shared/utils/constants/palette.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
    required this.actions,
  });

  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Palette.bgMid.primary
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: actions,
      ), 
    );
  }
}