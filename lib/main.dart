import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoms/app.dart';
import 'package:todoms/shared/theme/app_theme.dart';
import 'package:todoms/shared/theme/app_theme_data.dart';
import 'package:todoms/shared/theme/default_dark_theme.dart';

void main() {
  runApp(
    const ProviderScope(
      child: AppTheme(
        data: AppThemeData(
          palette: DefaultDarkPalette()
        ),
        child: TodomsApp(),
      ),
    ),
  );
}