import 'package:flutter/material.dart';
import 'package:todoms/shared/models/custom_color.dart';
import 'package:todoms/shared/utils/constants/palette.dart';

Color getProgressColor(double progress, { CustomColor? completeColor, bool muted = true }) {
    if (progress < 40) return muted ? Palette.crimsone.muted : Palette.crimsone.primary;
    if (progress < 80) return muted ? Palette.merigold.muted : Palette.merigold.primary;
    if (completeColor != null) {
      return muted ? completeColor.muted : completeColor.primary;
    }
    return muted ? Palette.green.muted : Palette.green.primary;
  }