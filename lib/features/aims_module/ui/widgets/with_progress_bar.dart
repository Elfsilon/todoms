import 'package:flutter/material.dart';
import 'package:todoms/shared/utils/constants/constants.dart';
import 'package:todoms/shared/utils/constants/palette.dart';

class WithProgressBar extends StatelessWidget {
  const WithProgressBar({
    super.key,
    required this.progress,
    required this.progressBarColor,
    required this.backgroundColor,
    required this.child,
  }): 
    assert(progress <= 1.0 && progress >= 0.0);

  final double progress;
  final Color progressBarColor;
  final Color backgroundColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final offset = MediaQuery.of(context).size.width * (1.0 - progress);
    return Stack(
      children: [
        Positioned.fill(
          child: SizedBox(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: Constants.borderRadius12,
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: 0,
          bottom: 0,
          right: offset,
          child: SizedBox(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: progressBarColor,
                borderRadius: Constants.borderRadius12,
              ),
            ),
          ),
        ),
        child,
      ],
    );
  }
}