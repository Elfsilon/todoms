import 'package:flutter/material.dart';
import 'package:todoms/shared/theme/app_theme.dart';

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
        color: AppTheme.of(context).palette.background.secondary
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: actions,
      ), 
    );
  }
}