import 'package:flutter/material.dart';
import 'package:todoms/shared/theme/app_theme.dart';
import 'package:todoms/shared/utils/constants/palette.dart';

class StatusBadge extends StatelessWidget {
  const StatusBadge({
    super.key,
    required this.status,
  });

  final bool status;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        color: status ? AppTheme.of(context).palette.custom.green.muted : Palette.bgDark.muted,
      ),
      child: status ? Icon(
        Icons.done_rounded, 
        color: AppTheme.of(context).palette.custom.green.primary
      ) : null,
    );
  }
}
