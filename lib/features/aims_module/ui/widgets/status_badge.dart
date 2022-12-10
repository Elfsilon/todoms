import 'package:flutter/material.dart';
import 'package:todoms/shared/theme/app_theme.dart';
import 'package:todoms/shared/utils/constants/palette.dart';

class StatusBadge extends StatelessWidget {
  const StatusBadge({
    super.key,
    required this.status,
  });

  final bool status;

  Duration get animationDuration => const Duration(milliseconds: 200);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: animationDuration,
      curve: Curves.easeIn,
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        color: status
            ? AppTheme.of(context).palette.custom.green.muted
            : Palette.bgDark.muted,
      ),
      child: AnimatedOpacity(
        opacity: status ? 1.0 : 0.0,
        curve: Curves.easeIn,
        duration: animationDuration,
        child: Icon(Icons.done_rounded,
            color: AppTheme.of(context).palette.custom.green.primary),
      ),
    );
  }
}
