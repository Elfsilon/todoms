import 'package:flutter/material.dart';
import 'package:todoms/shared/utils/constants/constants.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
    required this.progress,
    required this.backgroundColor,
    required this.progressBarColor,

  }):
  assert(progress >= 0.0 && progress <= 1.0);

  final double progress;
  final Color progressBarColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: Constants.borderRadius16,
      ),
      child: FractionallySizedBox(
        widthFactor: progress,
        alignment: Alignment.centerLeft,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: progressBarColor,
            borderRadius: Constants.borderRadius16,
          ),
        ),
      ),
    );
  }
}