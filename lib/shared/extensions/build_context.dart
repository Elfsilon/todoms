import 'package:flutter/material.dart';
import 'package:todoms/shared/theme/app_theme.dart';
import 'package:todoms/shared/theme/app_theme_data.dart';

extension BuildContextUtils on BuildContext {
  AppThemeData theme() => AppTheme.of(this);
}