import 'package:flutter/material.dart';
import 'package:todoms/shared/models/custom_color.dart';
import 'package:todoms/shared/theme/app_theme.dart';

enum LabelSize {
  small,
  medium,
  large,
}

class Label extends StatelessWidget {
  const Label({
    super.key,
    this.title,
    this.color,
    this.prefixIcon,
    this.suffixIcon,
    this.size = LabelSize.small,
  });

  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final CustomColor? color;
  final String? title;
  final LabelSize size;

  double _setSizes(double small, double medium, double large) {
    if (size == LabelSize.small) return small;
    if (size == LabelSize.medium) return medium;
    return large;
  }

  @override
  Widget build(BuildContext context) {
    final usedColor = color ?? AppTheme.of(context).palette.greywash.primary;

    final double iconSize = _setSizes(12, 20, 24);
    final double padding = _setSizes(2, 6, 8);
    final double fontSize = _setSizes(12, 14, 16);
    final double borderRadius = _setSizes(4, 8, 12);

    final sizedBox = SizedBox(width: padding);
    final sizedBoxExtended = title == null ? sizedBox : SizedBox(width: padding + 2);

    return Container(
      padding: EdgeInsets.symmetric(vertical: padding),
      decoration: color != null
        ? BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            color: usedColor.muted,
          )
        : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (prefixIcon != null) ...[
            sizedBox,
            Icon(prefixIcon, size: iconSize, color: usedColor.primary),
          ],
          sizedBoxExtended,
          if (title != null) ...[
            Text(
              title!,
              style: TextStyle(
                color: usedColor.primary, 
                fontSize: fontSize,
              )
            ),
            sizedBoxExtended,
          ],
          if (suffixIcon != null) ...[
            Icon(suffixIcon, size: iconSize, color: usedColor.primary),
            sizedBox,
          ],
        ],
      ),
    );
  }
}
