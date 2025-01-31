import 'package:flutter/material.dart';
import 'package:todoms/shared/models/custom_color.dart';
import 'package:todoms/shared/utils/constants/constants.dart';
import 'package:todoms/shared/utils/constants/palette.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onAction,
    this.filled = true,
    this.autoPop = true,
    this.fillColor,
  });

  final String label;
  final IconData icon;
  final bool filled;
  final bool autoPop;
  final CustomColor? fillColor;
  final Function() onAction;

  @override
  Widget build(BuildContext context) {
    final color = fillColor ?? Palette.crimsone;

    return SizedBox(
      height: 60,
      width: double.infinity,
      child: TextButton.icon(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(filled ? color.muted : Colors.transparent),
          overlayColor: MaterialStateProperty.all(filled ? color.muted : Palette.fgDark.primary),
          foregroundColor: MaterialStateProperty.all(filled ? color.primary : Palette.fgMid.primary),
          shape: MaterialStateProperty.all(const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          )),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        onPressed: () {
          if (autoPop) Navigator.of(context).pop();
          onAction();
        },
        icon: Icon(icon, size: Constants.s16),
        label: Text(label),
      ),
    );
  }
}